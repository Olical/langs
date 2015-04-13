# The base class is from the book.
# I'm adding the each method and CsvRow class.
module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = "#{self.class.to_s.downcase}.txt"
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each(&block)
      @csv_contents.each do |row|
        block.call(CsvRow.new(@headers, row))
      end
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end
end

class CsvRow
  def initialize(headers, row)
    @headers = headers
    @row = row
  end

  def method_missing(name)
    @row[@headers.find_index(name.to_s)]
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
csv.each {|row| puts row.one}
