Function RunTests {
    $coverage = "./spec/pytest_coverage.log"
    $run_tests = "bundle exec rspec --format documentation --format json --out ./spec/rspec.json"

    if ( Test-Path $coverage ) { Clear-Content $coverage }

    ForEach ($line in $(Invoke-Expression $run_tests)) {
        $line | Tee-Object -FilePath $coverage -Append
    }
    Write-Output "$(Get-TimeStamp)" | Out-file $coverage -Append
}

Function Get-TimeStamp {

    return "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)

}

if ($MyInvocation.InvocationName -ne ".") {
    RunTests
}
