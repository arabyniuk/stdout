module XLSXUtils
  def self.parse_rate_rows(file_name)
    sheet(file_name).map do |row|
      row = row.compact
      row if row.size == 6 && row[2].is_a?(Integer) && row[4].is_a?(Integer)
    end.compact
  end

  def self.rate_output(file_name)
    parse_rate_rows(file_name).each do |row|
      puts("POL: #{row[0]} | POD: #{row[1]} | TT: #{row[2]} | Rate: #{row[4]}")
    end
  end

  private

  def self.sheet(file_name)
    xlsx = Roo::Spreadsheet.open("./#{file_name}")
    xlsx.sheet(0)
  end
end
