require "rake/testtask"

task default: %w[basic:pass]

namespace :cleanup do
    task :all => [:basic, :banana, :potato, :summary]
    task :logs => [:basic, :banana, :potato]
    task :summary => [:summaries]

    task :basic do
        puts "running basic cleanup"
        Dir.glob("test/basic/*").select{ |file| /.backup$/.match file }.each do |file|
            File.delete(file)
        end
    end

    task :banana do
        puts "running banana cleanup"
        Dir.glob("test/banana/*").select{ |file| /.backup$/.match file }.each do |file|
            File.delete(file)
        end
    end

    task :potato do
        puts "running potato cleanup"
        Dir.glob("test/potato/*").select{ |file| /.backup$/.match file }.each do |file|
            File.delete(file)
        end
    end

    task :summaries do
        puts "running summary.log cleanup"
        [
            'test/basic/summary.log',
            'test/banana/summary.log',
            'test/potato/summary.log'
        ].each do |file|
            File.open(file, 'w') {|file| file.truncate(0) }
        end
    end
end

namespace :basic do
    Rake::TestTask.new :pass do |task|
        desc "PASS tests for type BASIC"
        task.pattern = "test/basic/pass/*_minitest.rb"
        task.warning = false 
    end

    Rake::TestTask.new :macros do |task|
        desc "Isolate Macrobutton tests for type BASIC"
        task.pattern = "test/basic/pass/macrobutton_*.rb"
        task.warning = false 
    end

    Rake::TestTask.new :setandget do |task|
        desc "Isolate Setter and Getter tests for type BASIC"
        task.pattern = "test/basic/pass/setandget*.rb"
        task.warning = false 
    end

    Rake::TestTask.new :alias do |task|
        desc "Isolate alias tests for type BASIC"
        task.pattern = "test/basic/pass/*_withalias_minitest.rb"
        task.warning = false 
    end 

    Rake::TestTask.new :vban do |task|
        desc "Isolate VBAN tests for type BASIC"
        task.pattern = "test/basic/pass/setvban*.rb"
        task.warning = false 
    end

    namespace :errors do
        Rake::TestTask.new :other do |task|
            desc "ERROR tests other type BASIC"
            task.pattern = "test/basic/errors/*_minitest.rb"
            task.warning = false 
        end

        Rake::TestTask.new :vbtype do |task|
            desc "ERROR tests vbtype for type BASIC"
            task.pattern = "test/basic/errors/*_vbtype.rb"
            task.warning = false 
        end
    end
end

namespace :banana do
    Rake::TestTask.new :pass do |task|
        desc "PASS tests for type BANANA"
        task.pattern = "test/banana/pass/*_minitest.rb"
        task.warning = false 
    end

    Rake::TestTask.new :macros do |task|
        desc "Isolate Macrobutton tests for type BANANA"
        task.pattern = "test/banana/pass/macrobutton_*.rb"
        task.warning = false 
    end
    
    Rake::TestTask.new :setandget do |task|
        desc "Isolate Setter and Getter tests for type BANANA"
        task.pattern = "test/banana/pass/setandget*.rb"
        task.warning = false 
    end

    Rake::TestTask.new :alias do |task|
        desc "Isolate alias tests for type BANANA"
        task.pattern = "test/banana/pass/*_withalias_minitest.rb"
        task.warning = false 
    end

    Rake::TestTask.new :base0 do |task|
        desc "Isolate base0 tests for type BANANA"
        task.pattern = "test/banana/pass/*_withalias_base0.rb"
        task.warning = false 
    end

    Rake::TestTask.new :vban do |task|
        desc "Isolate VBAN tests for type BANANA"
        task.pattern = "test/banana/pass/setvban*.rb"
        task.warning = false 
    end

    namespace :errors do
        Rake::TestTask.new :other do |task|
            desc "ERROR tests for type BANANA"
            task.pattern = "test/banana/errors/*_minitest.rb"
            task.warning = false 
        end

        Rake::TestTask.new :vbtype do |task|
            desc "ERROR tests for type BANANA"
            task.pattern = "test/banana/errors/*_vbtype.rb"
            task.warning = false 
        end
    end
end

namespace :potato do
    Rake::TestTask.new :pass do |task|
        desc "PASS tests for type POTATO"
        task.pattern = "test/potato/pass/*_minitest.rb"
        task.warning = false 
    end

    Rake::TestTask.new :macros do |task|
        desc "Isolate Macrobutton tests for type POTATO"
        task.pattern = "test/potato/pass/macrobutton_*.rb"
        task.warning = false 
    end

    Rake::TestTask.new :setandget do |task|
        desc "Isolate Setter and Getter tests for type POTATO"
        task.pattern = "test/potato/pass/setandget*.rb"
        task.warning = false 
    end 

    Rake::TestTask.new :alias do |task|
        desc "Isolate alias tests for type POTATO"
        task.pattern = "test/potato/pass/*_withalias_minitest.rb"
        task.warning = false 
    end

    Rake::TestTask.new :vban do |task|
        desc "Isolate VBAN tests for type POTATO"
        task.pattern = "test/potato/pass/setvban*.rb"
        task.warning = false 
    end

    namespace :errors do
        Rake::TestTask.new :other do |task|
            desc "ERROR tests for type POTATO"
            task.pattern = "test/potato/errors/*_minitest.rb"
            task.warning = false 
        end

        Rake::TestTask.new :vbtype do |task|
            desc "ERROR tests for type POTATO"
            task.pattern = "test/potato/errors/*_vbtype.rb"
            task.warning = false 
        end
    end
end
