
class Game
	
	def initialize
		@theComputer = Computer.new
		@player = Player.new
	end	

	def play

		puts "Do you want the computer to create a code? YES/NO"
		answer = gets.chomp

		#HERE THE PLAYER HAVE TO GUESS
		10.times do |i|
			puts "\nThis is round nr: #{i+1}"

			current_guess = @player.guess_code
			standing = evaluate_guess(current_guess)

			if standing[:match].length == 4
				puts "You won!"
			else
				puts "You have #{standing[:match].length} matches"
				puts "You have #{standing[:almost].length} near matches"
			end	
		end 



	end #end play

	def evaluate_guess(current_guess) 

		results = { :match => [], :almost => [] }

		current_guess.each_with_index do |color, position|
			if match?(color, position)
				results[:match] << true
			elsif almost_match?(color)
				results[:almost] << true
			end
		end	
		results
	end

	def almost_match?(color) #Metod som kollar om datorns kod innehåller en färg
		@theComputer.random_code.include?(color)
	end

	def match?(color, position) #Metod som kollar om både färg och position matchar
		color == @theComputer.random_code[position]

	end

end
#Klass som skapar en random kod
class Computer

	COLORS = ["B", "G", "R", "O", "Y", "P"]

	attr_reader :random_code

	def initialize
		@random_code = secret_code
	end
	def secret_code #Metod som genererar en kod utifrån constant array
    	COLORS.sample(4)
	end

end 
#Klass där spelarens val skapas och lagras
class Player
	
	def guess_code
		puts "Guess the code! Choose 4 colors from B, G, R, O, Y, P"
		guess = gets.chomp
		guess.upcase.split(" ")
	end

	def create_code
		puts "Create the code"
		code = gets.chomp
		code.upcase.split(" ")
	end
end 

g = Game.new
g.play












