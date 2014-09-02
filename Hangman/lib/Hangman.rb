


content = File.open("../dictionary.txt", "r") { |file| file.read }
good_words = content.split.select { |word| word.length.between?(5,12) }
@word = good_words[rand(good_words.size)].downcase.split("")


#Skapar ett nytt tomt array med @word.length och fyller med temporära värden
hidden_array = Array.new(@word.length)
@word.each_index { |i| hidden_array[i] = "-" }
print hidden_array

10.times do 
	puts "\nMata in en bokstav: "
	input = gets.chomp



	@word.each_with_index do |word, i|
		if input.include?(word)
			hidden_array[i] = input
		end
	end
	print "#{@word}" + "\n"
	print hidden_array
end