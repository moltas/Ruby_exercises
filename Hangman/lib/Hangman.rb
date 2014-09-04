





#Skapar ett nytt tomt array med @word.length och fyller med temporära värden


=begin
def initialize
	content = File.open("../dictionary.txt", "r") { |file| file.read }
	good_words = content.split.select { |word| word.length.between?(5,12) }
	@word = good_words[rand(good_words.size)].downcase.split("")
	@hidden_array = Array.new(@word.length)
	@word.each_index { |i| hidden_array[i] = "-" }


	puts "\nMata in en bokstav: "
	@input = gets.chomp
end

def check_correct?(input, hidden_array)

	@word.each_with_index do |word, i|
		if input.include?(word)
			hidden_array[i] = input
		end
	end
	print "#{@word}" + "\n"
	print hidden_array

end

#måste lägga till sätt att ge respons till användaren

def remaining_guesses(current_guess)
	letters = ("a".."z").to_a



end

remaining_guesses(input)
check_correct?(@input, hidden_array)

=end

class User_input

	def get_input
		puts "\nMata in en bokstav: "
		input = gets.chomp
		input.upcase
	end

	def return_input

	end

end

class Random_word

	attr_accessor :random_word

	def initialize
		content = File.open("../dictionary.txt", "r") { |file| file.read }
		good_words = content.split.select { |word| word.length.between?(5,12) }
		word = good_words[rand(good_words.size)].downcase.split("")
		@random_word = word.map { |word| word.upcase}
		@fail_guess = Array.new
	end
end

class Play
	def initialize
		@rand_word = Random_word.new
		@input_obj = User_input.new

		@word = @rand_word.random_word		
		#@input = @input_obj.get_input 

		@hidden_array = Array.new(@word.length)
		@word.each_index { |i| @hidden_array[i] = "_" }
		@fail_guess = Array.new
		@used_letters = Array.new
		check_if_correct(@hidden_array)
	end

	def check_if_correct(hidden_array)

		counter = 0

		while counter <= 10

			current_guess = @input_obj.get_input


			@word.each_with_index do |word, i|
				if current_guess.include?(word)
					hidden_array[i] = current_guess
					@used_letters += current_guess
				end
			end



			unless hidden_array.include?(current_guess)
				print "\nThat letter isn't in the word\n"
				puts current_guess
				@fail_guess << current_guess
				counter += 1
			end

			if used_letters(current_guess[-1]).include? (current_guess)
				puts "You've already used that word!"
			end


			#print "#{@word}" + "\n"
			#print "Used words: #{failed_guesses}\n\n"
			print "\n#{hidden_array}\n"
			print @fail_guess

		end

	end



end #end class Play


p = Play.new

#GÖRA IMORGON: gör stor if sats, och skapa fler metoder för att underlätta 
