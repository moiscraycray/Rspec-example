require 'csv'

module Util

  def self.read_csv_file(file)
    begin
      CSV.read(file)
    rescue
      return nil
    end
  end

  def self.read_first_line(file)
    begin
      array = CSV.read(file)[1].join(",")
    rescue
      nil
    end
  end

  def self.add_entry(entry, file)
    begin
      f =CSV.open(file, "ab")
      temp =[]
      # headers = f[0]
      entry.each{|k,v| temp << v}
      # entry.each{|k,v|
      #   headers.each_with_index{|heading|
      #   temp << v if heading == k
      #   }
      # }
      f << temp
      f.close
      # CSV.open(file, "ab"){f}
      # CSV.open(file, "wb") {|csv| entry.to_a.each {|elem| csv << elem} }
    rescue
      nil
    end
  end

  def self.check_last_line(file)
    begin
      array = CSV.read(file).last.join(",")
    rescue
      nil
    end
  end

  def delete_last_line(file)
    begin
      array = CSV.open(file, "ab")
      array.pop
    rescue
      nil
    end
  end

end
