# frozen_string_literal: true

require 'csv'
require 'prawn'

rows = CSV.read('data.csv')[1..-1]

Prawn::Document.generate('letters.pdf') do
  rows.each_with_index do |row, index|
    full_name = row[0]
    address = row[1]

    message = <<~MESSAGE
      Кому: #{full_name}
      Адрес: #{address}

      Тело письма
    MESSAGE

    font('font/OpenSans-Regular.ttf') do
      text message
    end

    start_new_page if (index + 1) < rows.length
  end
end

print 'letters.pdf has been generated'
