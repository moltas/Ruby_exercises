# encoding: utf-8


#Klass som sparar användarinput
class User_input

	def get_input
		puts "\nEnter a letter: "
		input = gets.chomp
		input.upcase
	end

	def return_input

	end

end

#Klass som hämtar ett slumpat ord från en dictionary fil
class Random_word

	attr_accessor :random_word

	def initialize
		content = File.open("../dictionary.txt", "r") { |file| file.read }
		good_words = content.split.select { |word| word.length.between?(5,12) }
		word = good_words[rand(good_words.size)].downcase.split("")
		@random_word = word.map { |word| word.upcase}
	end
end


class Game
	def initialize
		@rand_word = Random_word.new
		@input = User_input.new
		@word = @rand_word.random_word		
		@hidden_array = Array.new(@word.length)
		@word.each_index { |i| @hidden_array[i] = "_" }
		@fail_guess = Array.new
		@used_letters = Array.new
		play
	end

	#metod som kör spelet
	def play
	
		times_left = 10 

		while times_left > 0

			#OUTPUT------------------------------		
			puts "\n\n_______Right Guesses___________"
			#print "Used words: #{failed_guesses}\n\n"
			print "\n    #{@hidden_array.join(" ")}\n\n"
			puts "_______Used Letters________________"
			print "\n    #{@fail_guess.join(", ")}\n\n"
			puts "___________________________________"
			print "\nTries left: #{times_left}\n\n\n"


			current_guess = @input.get_input

			if current_guess.length == 0
				puts "You didn't type anything"
				current_guess
			elsif current_guess.length == 1

				if check_already_exists?(current_guess) == true
					puts "That letter is already used"
					current_guess

				elsif check_correct_answer?(current_guess) == true	

					@word.each_with_index do |word, i|

						if word.include? (current_guess)
							@hidden_array[i] = current_guess
							@used_letters << current_guess

						end
					end			
				else
					puts "\nWrong guess\n\n"
					@used_letters << current_guess
					@fail_guess << current_guess
					times_left -= 1
				end
			end


			if did_I_win? == true #kollar efter vinst
				puts "\nYOU WON!!\n"				
				puts "That's right the word is: #{@hidden_array.join()}"
				break
			end

		end #end while
		
		if did_I_lose?(times_left) == true #kollar efter förlust
			puts "\nYou lost :((\n"
			puts "The word was: #{@word.join()}"	
		end

	end #end method


	#Kollar om input är rätt svar
	def check_correct_answer?(input)
		if @word.include? input
			return true
		end
		return false
	end

	#Kollar om värdet redan har angets
	def check_already_exists?(input)
		if @used_letters.include? input
			return true
		end	
		return false
	end

	#kollar om du har vunnit
	def did_I_win?
		if @hidden_array == @word
			return true
		end
		return false
	end

	#Kollar om du har förlorat
	def did_I_lose?(times_left)
		if times_left == 0
			return true
		end
		return false
	end


end #end class Play


#instansierar nytt spel
g = Game.new

