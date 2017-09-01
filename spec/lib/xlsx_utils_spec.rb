require 'rails_helper'
require 'spec_helper'

feature "xlsx utils" do
  let(:rate_output) do
    XLSXUtils.parse_rate_rows('sailings.xlsx').inject("") do |sum, row|
      sum + "POL: #{row[0]} | POD: #{row[1]} | TT: #{row[2]} | Rate: #{row[4]}"
    end
  end

  scenario "check stdout rate output" do
    expect {
      XLSXUtils.rate_output('sailings.xlsx')
    }.to output(/#{rate_output}/).to_stdout
  end
end
