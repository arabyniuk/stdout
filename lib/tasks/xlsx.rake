def file_name
  ENV['FILE'] || 'sailings.xlsx'
end

namespace :xlsx do
  desc "Output rate rows"
  task parse_rate: :environment do
    XLSXUtils.rate_output(file_name)
  end
end
