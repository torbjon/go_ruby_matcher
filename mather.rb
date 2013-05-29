def read_file(filename)
  arr = []
  File.open(filename, "r:UTF-8") do |f|
    f.each_line do |line|
      arr << line.gsub("\n", "")
    end
  end
  arr
end

matched  = []
texts    = read_file("data/texts.txt")
patterns = read_file("data/keywords.txt")

texts.each do |text|
  patterns.each do |pattern|
    matched << pattern if text.include?(pattern)
  end
end

puts matched.count