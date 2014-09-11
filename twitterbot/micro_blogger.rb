require 'jumpstart_auth'
require 'twitter'
require 'time'

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
  		case command
  			when "q" then puts "Goodbye!"
  			when "t" then tweet(parts[1..-1].join(" "))
  			when "p" then post(parts[1..-1].join(" "))	
  			else
  				puts "Sorry, I don't know how to #{command}"		
  		end
  	end
  end

  def post(message)

    x = Time.new

    while x.hour <= 24
      x = Time.new
      if x.sec == 10
        puts "sending to twitter..."
        tweet(message)
      end 

    end   

  end


end

b = MicroBlogger.new

b.run



