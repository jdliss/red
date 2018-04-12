#!/usr/bin/env ruby

require 'terminfo'
require 'remedy'

file = ARGV[0]
if file.nil?
  puts 'File name parameter is required.'
  return
end
system('clear')

screen = Array.new(TermInfo.screen_height) { Array.new(TermInfo.screen_width) }

sleep 0.2

io_stream = File.open(file)

io_stream.each_with_index do |line, i|
  line.chars.each_with_index do |char, j|
    screen[i][j] = char
  end
end

(screen.size - 1).times do |i|
  if screen[i].all?(&:nil?)
    puts '-'.ljust(4)
    next
  end

  line_num = "#{i + 1}:"
  puts "#{line_num.ljust(4, ' ')} #{screen[i].join('')}"
end

include Remedy

def identify_keypress
  user_input = Interaction.new

  user_input.loop do |k|
    # pass
  end
end

loop do
  begin
    identify_keypress
  rescue Interrupt
    system('reset')
    break
  end
end
