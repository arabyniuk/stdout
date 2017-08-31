require 'rails_helper'
require 'spec_helper'
require 'rake'

feature "xlsx rake task" do
  let(:output_size) { XLSX.new('sailings.xlsx').parse_rate_rows.size }

  before do
    load Rails.root.join("lib/tasks/xlsx.rake")
    Rake::Task.define_task(:environment)
  end

  after { Rake.application.clear }

  scenario "check task output" do
    task = Rake::Task["xlsx:parse_rate"]

    expect {
      task.invoke
    }.to output(/Outputs #{output_size} rates/).to_stdout
  end
end
