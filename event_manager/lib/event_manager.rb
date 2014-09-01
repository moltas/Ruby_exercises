
require 'csv'
require 'sunlight/congress'
require 'erb'
require "date"

#denna övning är från JumpstartLab och heter EventManager


#this is the header
# ,RegDate, first_Name, last_Name, Email, Phone

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

#metod som 
def phone_number(phone)
	phone = phone.to_s.scan(/\d+/).join

	if phone.length != 10
		if phone.length == 11 && phone[0] == 1
			phone = phone[1..-1]
		else
			phone = "0000000000"
		end
	end
	phone[0..2] + "-" + phone[3..5] + "-" + phone[6..9]
end

#Metod som kollar vilken timme som är vanligast
def peak_hours(hour_hash)
	
	best_hour = hour_hash.select do |hour, registrations|
		registrations == hour_hash.values.max
	end
	best_hour.keys.join(", ")
end

#Metod som kollar vilken dag som är vanligast
def peak_days(day_hash)

	weekday = %w{sunday, monday, tuesday, wednesday, thursday, friday, saturday}

	best_day = day_hash.select do |day, registrations|
		registrations == day_hash.values.max
	end
	#mappar 
	best_day.keys.map { |day| weekday[day] }.join(", ")

end

puts "EventManager initialized."

contents = CSV.open '../event_attendees.csv', headers: true, header_converters: :symbol, encoding: "ISO8859-1"

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

#skapar en hash för att hålla reda på timmar och registrerade
hour_hash = Hash.new(0)
day_hash = Hash.new(0)

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  phone = phone_number(row[:homephone])

  legislators = legislators_by_zipcode(zipcode)
  form_letter = erb_template.result(binding)

  save_thank_you_letters(id, form_letter)

  #Initierar ett nytt DateTime objekt
  datetime = DateTime.strptime(row[:regdate], '%m/%d/%y %k:%M')

  #lägger till timmen i hashet "hour" och plussar på antal.
  hour_hash[datetime.hour] += 1
  #samma som ovan fast returnerar vilken veckodag det är, tex. 3 som är tisdag (sön,mån,tis)
  day_hash[datetime.wday] += 1

end

print "\nThe peak hours is: #{peak_hours(hour_hash)}\n"
print "\nThe peak days is: #{peak_days(day_hash)}\n"

