require "rake/testtask"
require 'voicemeeter'

task default: %w[basic:pass]
task :everything do
    test = Remote.new("basic")
    test.run do 

        puts "Running all BASIC tests"
        Rake.application.in_namespace(:basic){|namespace| namespace.tasks.each(&:invoke)}
        test.command.shutdown

        puts "Running all BANANA tests"
        Rake.application.in_namespace(:banana){|namespace| namespace.tasks.each(&:invoke)}
        test.command.shutdown

        puts "Running all POTATO tests"
        Rake.application.in_namespace(:potato){|namespace| namespace.tasks.each(&:invoke)}
        test.command.shutdown

    end
end

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
            File.open(file, 'w') { |file| file.truncate(0) }
        end
    end
end

namespace :basic do
    task :all => [:pass, :macros, :setandget, :multi, :alias, :base0, :vban]

    Rake::TestTask.new :pass do |task|
        desc "PASS tests for type BASIC"
        task.pattern = "test/basic/pass/*_minitest.rb"
        task.warning = false
    end

    Rake::TestTask.new :macros do |task|
        desc "Isolate Macrobutton tests for type BASIC"
        task.pattern = "test/basic/pass/macrobutton_status*.rb"
        task.warning = false
    end

    Rake::TestTask.new :setandget do |task|
        desc "Isolate Setter and Getter tests for type BASIC"
        task.pattern = "test/basic/pass/setandget*.rb"
        task.warning = false
    end

    Rake::TestTask.new :multi do |task|
        desc "Isolate Set Multiple Params tests for type BASIC"
        task.pattern = "test/basic/pass/*multi_minitest.rb"
        task.warning = false
    end

    Rake::TestTask.new :alias do |task|
        desc "Isolate alias tests for type BASIC"
        task.pattern = "test/basic/pass/*_withalias_minitest.rb"
        task.warning = false
    end

    Rake::TestTask.new :base0 do |task|
        desc "Isolate base0 tests for type BASIC"
        task.pattern = "test/basic/pass/*base0_status*.rb"
        task.warning = false
    end

    Rake::TestTask.new :vban do |task|
        desc "Isolate VBAN tests for type BASIC"
        task.pattern = "test/basic/pass/setvban*.rb"
        task.warning = false
    end

    namespace :errors do
        task :all => [:other, :vbtype]

        Rake::TestTask.new :other do |task|
            desc "ERROR tests other type BASIC"
            task.pattern = "test/basic/errors/errors*.rb"
            task.warning = false
        end

        Rake::TestTask.new :vbtype do |task|
            desc "ERROR tests vbtype for type BASIC"
            task.pattern = "test/basic/errors/vbtype*.rb"
            task.warning = false
        end
    end
end

namespace :banana do
    task :all => [:pass, :macros, :setandget, :multi, :alias, :base0, :vban]

    Rake::TestTask.new :pass do |task|
        desc "PASS tests for type BANANA"
        task.pattern = "test/banana/pass/*_minitest.rb"
        task.warning = false
    end

    Rake::TestTask.new :macros do |task|
        desc "Isolate Macrobutton tests for type BANANA"
        task.pattern = "test/banana/pass/macrobutton_status*.rb"
        task.warning = false
    end

    Rake::TestTask.new :setandget do |task|
        desc "Isolate Setter and Getter tests for type BANANA"
        task.pattern = "test/banana/pass/setandget*.rb"
        task.warning = false
    end

    Rake::TestTask.new :multi do |task|
        desc "Isolate Set Multiple Params tests for type BANANA"
        task.pattern = "test/banana/pass/*multi_minitest.rb"
        task.warning = false
    end

    Rake::TestTask.new :alias do |task|
        desc "Isolate alias tests for type BANANA"
        task.pattern = "test/banana/pass/*_withalias_minitest.rb"
        task.warning = false
    end

    Rake::TestTask.new :base0 do |task|
        desc "Isolate base0 tests for type BANANA"
        task.pattern = "test/banana/pass/*base0_status*.rb"
        task.warning = false
    end

    Rake::TestTask.new :vban do |task|
        desc "Isolate VBAN tests for type BANANA"
        task.pattern = "test/banana/pass/setvban*.rb"
        task.warning = false
    end

    namespace :errors do
        task :all => [:other, :vbtype]

        Rake::TestTask.new :other do |task|
            desc "ERROR tests for type BANANA"
            task.pattern = "test/banana/errors/errors*.rb"
            task.warning = false
        end

        Rake::TestTask.new :vbtype do |task|
            desc "ERROR tests for type BANANA"
            task.pattern = "test/banana/errors/vbtype*.rb"
            task.warning = false
        end
    end
end

namespace :potato do
    task :all => [:pass, :macros, :setandget, :multi, :alias, :base0, :vban]

    Rake::TestTask.new :pass do |task|
        desc "PASS tests for type POTATO"
        task.pattern = "test/potato/pass/*_minitest.rb"
        task.warning = false
    end

    Rake::TestTask.new :macros do |task|
        desc "Isolate Macrobutton tests for type POTATO"
        task.pattern = "test/potato/pass/macrobutton_status*.rb"
        task.warning = false
    end

    Rake::TestTask.new :setandget do |task|
        desc "Isolate Setter and Getter tests for type POTATO"
        task.pattern = "test/potato/pass/setandget*.rb"
        task.warning = false
    end

    Rake::TestTask.new :multi do |task|
        desc "Isolate Set Multiple Params tests for type POTATO"
        task.pattern = "test/potato/pass/*multi_minitest.rb"
        task.warning = false
    end

    Rake::TestTask.new :alias do |task|
        desc "Isolate alias tests for type POTATO"
        task.pattern = "test/potato/pass/*_withalias_minitest.rb"
        task.warning = false
    end

    Rake::TestTask.new :base0 do |task|
        desc "Isolate base0 tests for type POTATO"
        task.pattern = "test/potato/pass/*base0_status*.rb"
        task.warning = false
    end

    Rake::TestTask.new :vban do |task|
        desc "Isolate VBAN tests for type POTATO"
        task.pattern = "test/potato/pass/setvban*.rb"
        task.warning = false
    end

    namespace :errors do
        task :all => [:other, :vbtype]

        Rake::TestTask.new :other do |task|
            desc "ERROR tests for type POTATO"
            task.pattern = "test/potato/errors/errors*.rb"
            task.warning = false
        end

        Rake::TestTask.new :vbtype do |task|
            desc "ERROR tests for type POTATO"
            task.pattern = "test/potato/errors/vbtype*.rb"
            task.warning = false
        end
    end
end
