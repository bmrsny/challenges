class Pather
  attr_accessor :map, :column_start, :path_end, :no_row_path
  attr_reader :markers

  FIND_CHAR = "#"

  def create_path
    read_map
    set_coordinates
    generate_path
    save_output
  end

  def read_map
    path_map = ""
    f = File.open(ARGV[0], "r")
    f.each_line {|line| path_map << line}
    @map = path_map.split("\n").map(&:chars)
  end

  def set_coordinates
    @markers = map.map.with_index do |row, index|
      set_marker(row, index) if row.include?(find_char)
    end
  end

  def set_marker(row, index)
    row.each_with_index do |char, char_index|
      return [index, char_index] if char == find_char
    end
  end

  def generate_path
    markers.length.times do |index|
      @index = index
      draw_path(index) unless next_marker == nil
    end
  end

  def draw_path(index)
    case
    when valid_row_path? then set_row_connection(current_marker, next_marker)
    when valid_col_path? then set_col_connection(current_marker, next_marker)
    else                      set_connection(current_marker, next_marker)
    end
  end

  def valid_row_path?
    current_row == next_row
  end

  def current_marker
    markers[@index]
  end

  def current_row
    current_marker[0]
  end

  def next_marker
    markers[@index + 1]
  end

  def next_row
    next_marker[0]
  end

  def set_row_connection(start, finish)
    until counter == (ending -1)
      counter += 1
      map[row][counter] = "*"
    end
  end

  def valid_col_path?(coordinates, index)
    coordinates[1] == markers[index + 1][1]
  end

  def set_column_connection(start, finish)
    char_index = markers[index][1]
    current_row_index = markers[index][0]
    until current_row_index >= path_end[0]
      current_row_index += 1
      map[current_row_index][char_index] = "*"
    end
  end

  def set_connection(start, finish)
    col = start[1]
    row = finish[0]
    connection = [row, col]

    set_column_connection(current_marker, connection)
    set_row_connection(connection, next_marker)
    change_temp_connectors(connection)
  end

  def save_output
    final_map = map.flat_map(&:join).join("\n") + "\n"

    new_file = File.open(ARGV[1], "w")
    new_file << final_map
  end
end

path = Pather.new
path.create_path


