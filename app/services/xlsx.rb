class XLSX
  def initialize(file_name)
    xlsx = Roo::Spreadsheet.open("./#{file_name}")
    @sheet = xlsx.sheet(0)
  end

  def parse_rate_rows
    @sheet.map do |row|
      row = row.compact
      row if row.size == 6 && row[2].is_a?(Integer) && row[4].is_a?(Integer)
    end.compact
  end
end
