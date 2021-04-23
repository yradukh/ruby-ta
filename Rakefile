# frozen_string_literal: true

desc 'This task will execute all tests'
task :execute_tests do
  %w[create_report_folder_structure run_cucumber].each do |task_name|
    sh "rake #{task_name}"
  end
end

desc 'This task will create cucumber report folder structure'
task :create_report_folder_structure do
  Dir.mkdir 'artifacts' unless Dir.exist? 'artifacts'
  Dir.mkdir 'artifacts/junit' unless Dir.exist? 'artifacts/junit'
  Dir.mkdir 'artifacts/json' unless Dir.exist? 'artifacts/json'
end

desc 'This task will run cucumber tests and generate reports'
task :run_cucumber do
  sh 'cucumber --publish-quiet -f junit -o artifacts/junit -f pretty -f json -o artifacts/json/report.json'
end
