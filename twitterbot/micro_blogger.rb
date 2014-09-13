#Encoding: ISO-8859-1
require 'jumpstart_auth'
require 'twitter'
require 'time'
require 'tk'

class MicroBlogger
  attr_reader :client
  def initialize
    puts "Initializing MicroBlogger"
    @client = JumpstartAuth.twitter   
  end

  def tweet(message)
  	if message.length <= 140
  		@client.update(message)
  	elsif message.length > 140
  		puts "Your tweet is too long, try again."
  	end
  end
  def run
  	command = ""
  	while command != "q"
  		printf "enter command: "
  		input = gets.chomp
  		parts = input.split(" ")
  		command = parts[0]
      fact = Fun_facts.new
  		case command
  			when "q" then puts "Goodbye!"
  			when "t" then tweet(parts[1..-1].join(" "))
  			when "p" then post(fact.random_sentence)	 
  			else
  				puts "Sorry, I don't know how to #{command}"		
  		end
  	end
  end

  def post(message)
    x = Time.new
    while x.hour <= 24
      x = Time.new
      if x.min 
        puts "sending to twitter..."
        tweet(message)    
      end 
    end   
  end

end #end class

class Fun_facts
  attr_accessor :facts
  def initialize
    @facts = random_sentence
  end
  def random_sentence
    sentence = File.readlines("facts/facts.txt").sample
  end
end

b = MicroBlogger.new
b.run

