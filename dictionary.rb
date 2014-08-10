
#Only words from this array can be used in the histogram
dictionary = ["fist", "go", "down", "sit", "yes", "first", "crap", "six","milk", "let", "kids", "mad", "shit"]


puts "Please sir, enter some text"
text = gets.chomp


def substrings(word, arr)

	#splits the words 
	word = word.split(" ").to_a

	frequencies = Hash.new(0)

	arr.each do |x|
		
		word.each do |word| 
			if word.include? x
				frequencies[word] += 1
			end	
		end
	end


	puts  "Word counter:\n"
	frequencies.each { |word, frequency| puts word + " " + frequency.to_s}


	if word == arr
		puts "funka"
	end

end

#call the method
substrings(text, dictionary)