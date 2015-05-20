class Replace

  attr_accessor :replace, :replace_count, :array, :find_char

  def initialize(array, find_char)
    @array         = array
    @find_char     = find_char
    @replace       = false
    @replace_count = 1
  end

  def replace
    @array.map do |value|
      @replace = this_one?(value)
      value = "." if @replace == true
      value
    end
  end

  def this_one?(value)
    @replace_count += 1 if value == @find_char
    if @replace_count%2 == 0 && value != @find_char
      true
    else
      false
    end
  end

end

puts Replace.new(["$","$","$","^", "$","$", "^","$","$","^","$","^"], "^").replace

#first attempt not a great idea
#!/usr/bin/env ruby

# class Pather
#   attr_accessor :rows
#   attr_reader :path_map
#
#   def initialize
#     @path_map = ""
#     f =  File.open(ARGV[0], "r")
#     f.each_line {|line| path_map << line}
#     @find_char              = "#"
#     @repace                 = false
#     @starting_row_index     = nil
#     @ending_row_index       = nil
#     @starting_char_position = nil
#     @ending_char_position   = nil
#     @row_count              = 0
#     @found_char_count       = 0
#     @rows = path_map.split("\n")
#   end
#
#   def create_new_path
#     row_path
#     column_path
#     puts rows
#   end
#
#   def row_path
#     rows.each do |row|
#       if row.scan(@find_char).size > 1
#        #ugghghghghg
#       end
#     end
#   end
#
#   #def row_path
#   #rows.each do |row|
#   #if row.scan(@find_char).size > 1
#   #chars = row.chars
#   #chars.map do |char|
#   #@replace = this_one?(char)
#   #char = "*" if @replace == true
#   #end
#   #else
#   #end
#   #end
#   #end
#
#   #def this_one?(char)
#   #@row_count += 1 if char == @find_char
#   #if @row_count % 2 == 0 && char != @find_char
#   #true
#   #else
#   #false
#   #end
#   #end
#
#   def column_path
#     set_column_positions
#
#     current_index = @starting_row_index
#     until current_index >= @ending_row_index
#       current_index += 1
#       rows[current_index][@starting_char_position] = "*"
#     end
#   end
#
#   def set_column_positions
#     rows.each_with_index do |row, index|
#       set_starting_postition(row, index)
#       set_ending_position(row, index)
#     end
#   end
#
#   def set_starting_postition(row, index)
#     if row.include?(@find_char) && @found_char_count == 0
#       @found_char_count += 1
#       @starting_row_index = index
#       @starting_char_position = row.index(@find_char)
#     end
#     #need to set last # in row if column has 2 #s
#   end
#
#   def set_ending_position(row, index)
#     if row.include?(@find_char) && @found_char_count >= 1
#       @ending_row_index = index
#       @ending_char_position = row.index(@find_char)
#     end
#   end
# end
#
# path = Pather.new
# path.create_new_path
