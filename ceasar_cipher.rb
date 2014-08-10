
#Ceasar cipher

def myCipher(word, n)

	letters = ("a".."z").to_a

	new_word = ""

	word.each_char do |x|
		if !letters.include?(x)
			new_word +=x
		else
			new_word += letters[letters.index(x.downcase) - n]
		end
	end

	return new_word.downcase.capitalize
	end

	puts myCipher("There is no tomorrow!", 2)



