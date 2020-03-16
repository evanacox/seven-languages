module ActsAsCsv 
  class CsvRow
    def method_missing(name, *args)
      column = name.to_s

      row_idx = @rows.find_index column

      @data[row_idx] unless row_idx == nil 
    end
    
    def initialize(row_names, data)
      @rows = row_names
      @data = data
    end
  end 

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods 
    attr_accessor :headers, :csv_contents

    def read 
      @csv_contents = []

      file = File.new(self.class.to_s.downcase + '.csv')
      @headers = file.gets.chomp.split(', ')

      file.each do |row| 
        # split data into the columns
        data = row.chomp.split(', ')

        # append trimmed columns
        @csv_contents << data.collect { |field| field.strip } 
      end
    end

    def each(&block) 
      @csv_contents.each { |row| block.call CsvRow.new(headers, row) }
    end

    def initialize 
      read 
    end 
  end
end

class CsvReader
  include ActsAsCsv
  acts_as_csv
end

reader = CsvReader.new 

reader.each { |row| puts row.name }
