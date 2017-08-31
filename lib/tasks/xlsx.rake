def file_name
  ENV['FILE'] || 'sailings.xlsx'
end

def rate_rows
  @rate_rows ||= XLSX.new(file_name).parse_rate_rows
end

namespace :xlsx do
  desc "Output rate rows"
  task parse_rate: :environment do
    rate_rows.each do |row|
      puts("POL: #{row[0]} | POD: #{row[1]} | TT: #{row[2]} | Rate: #{row[4]}")
    end
    puts "Outputs #{rate_rows.size} rates"
  end
end
