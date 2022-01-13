require "rake/testtask"

task default: %w[higher:pass]

task :all do
    Rake.application.in_namespace(:higher){|namespace| namespace.tasks.each(&:invoke)}

    Rake.application.in_namespace(:lower){|namespace| namespace.tasks.each(&:invoke)}
end

namespace :higher do
    Rake::TestTask.new :pass do |task|
        desc "Higher tests type PASS"
        task.pattern = "test/higher/*"
        task.warning = false
    end
end

namespace :lower do
    Rake::TestTask.new :pass do |task|
        desc "Lower tests type PASS"
        task.pattern = "test/lower/*"
        task.warning = false
    end
end
