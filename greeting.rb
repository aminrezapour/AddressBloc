def greeting
  greeting_master = ARGV[0]

  ARGV.each_with_index do |arg, i|
    puts "#{greeting_master} #{arg}" unless i == 0
  end

# alternative solution
  # for i in 1...ARGV.length
  #   puts "#{ARGV[0]} #{ARGV[i]}"
  # end

end

greeting
