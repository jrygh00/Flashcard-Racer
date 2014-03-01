def reputs(str = '')
  puts "\e[0K" + str
end

# Clear the screen
def clear!
  print "\e[2J"
end

# Moves cursor to the top left of the terminal
def reset_cursor!
  print "\e[H"
end

# Probably unnecessary.
# Flushes the STDOUT buffer.
# By default STDOUT is only flushed when it encounters a newline (\n) character
# def flush!
#   $stdout.flush
# end