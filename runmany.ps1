param(
        [parameter(Mandatory=$false)]
        [Int] $num = 1,
        [switch]$cycle,
        [switch]$log,
        [parameter(Mandatory=$false)]
        [switch]$h,[switch]$l
        )

if ($h) { $type = "higher" }
elseif ($l) { $type = "lower" }
else { $type = "higher" }

$global:failures = 0

Function RunTests {
        param([int]$cycle_num)
        if ($cycle_num) {
                $num = $cycle_num
        }

        $_runtests = "rake ${type}:pass" 
        $logfile = "test/${type}.log"

        if($log) {
                1..$num | ForEach-Object `
                { "Running test $_ of $num" | Tee-Object -FilePath $logfile -Append
                Invoke-Expression $_runtests | Tee-Object -FilePath $logfile -Append }

                ParseLogs -logfile $logfile                
        } else {
                1..$num | ForEach-Object `
                { Write-Host "Running test $_ of $num"
                Invoke-Expression $_runtests }
        }
}

Function ParseLogs {
        param([string]$logfile)
        $summary_file = "test/${type}/summary.log"
        $RESULT_PATTERN = "^[0-9]+\s"
        $m = $(Get-content -Path "lib/base.rb" | Select-String -AllMatches "DELAY = (\d+.\d+)")
        $delay = $m.Matches[0].Groups[1].Value
        $m = $(Get-content -Path "lib/base.rb" | Select-String -AllMatches "MAX_POLLS = (\d+)")
        $max_polls = $m.Matches[0].Groups[1].Value

        $DATA = @{
                "runs" = 0
                "assertions" = 0
                "failures" = 0
                "errors" = 0
                "skips" = 0                
        }

        ForEach ($line in `
        $(Get-content -Path "${logfile}")) {
                if ($line -match $RESULT_PATTERN) {
                        $values = $line.split(",")

                        $value = $values[0].split()[0]
                        $name = $values[0].split()[1]
                        $DATA[$name] += [int]$value

                        1..4 | ForEach-Object {
                                $value = $values[$_].split()[1]
                                $name = $values[$_].split()[2]
                                $DATA[$name] += [int]$value                       
                        }
                }
        }

        $savefile = LogRotate -logfile $logfile
        $log_backupfile = Split-Path $savefile -leaf
        
        "============================================`n" + `
        "Version: ${t} | Test type: ${type}`n" + `
        "Logfile for this test run: ${log_backupfile}`n" + `
        "==============================================" | Tee-Object -FilePath $summary_file -Append
        "${num} tests run with a delay of ${delay} and max_polls of ${max_polls}" | `
        Tee-Object -FilePath $summary_file -Append
        ${DATA} | ForEach-Object { $_ } | Tee-Object -FilePath $summary_file -Append

        $global:failures = $DATA["failures"]
}

Function LogRotate {
        param([string]$logfile)
        Get-ChildItem ./ -recurse `
        | Where-Object {$_.basename -ne 'summary' -and $_.extension -eq ".log" } `
        | ForEach-Object {
                $i = 1
                $StopLoop = $false
                
                do {
                        try {
                                $savefile = "$($_.Fullname)_$i.backup"
                                Rename-Item -Path $_.FullName `
                                -NewName $savefile -ErrorAction "Stop"

                                $StopLoop = $true
                        }
                        catch {
                                Start-Sleep -m 100
                                $i++
                        }      
                } until ($StopLoop -eq $true)
        }
        $savefile
}


if ($MyInvocation.InvocationName -ne ".")
{
        if ($cycle) {
                @(100, 200, 500, 1000) | ForEach-Object {
                        RunTests -cycle_num $_
                        if ($global:failures -gt 0) { break }
                }
        } else { RunTests }
}