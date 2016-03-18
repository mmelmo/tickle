# SELLER INFO
puts "email: "
email = gets.gsub("\n","")

puts "full name: "
name = gets.gsub("\n","")

puts "zip code: "
zip_code = gets.gsub("\n","")

# TICKET INFO
puts "artist: "
artist = gets.gsub("\n","")

puts "event location: "
location = gets.gsub("\n","")

puts "event date: "
date = gets

puts "# of tickets: "
number_of_tickets = gets.gsub("\n","")

puts "price per ticket: "
price_per_ticket = gets.gsub("\n","")

title = artist + " - " + location + " - " + date + " - " + number_of_tickets + " tickets - $" + price_per_ticket
body = "Selling " + number_of_tickets + " " + artist + " tickets ($" + price_per_ticket + "/ticket) at " + location + " on " + date + ". Accepting Paypal or Venmo!"

require 'watir-webdriver'
b = Watir::Browser.new
b.goto("https://post.craigslist.org/c/sfo")

b.radio(value: "fso").set

b.radio(value: "44").set

b.radio(value: "1").set

# TODO: use all radios instead of just first ten
b.radios[rand(0..5)].set

b.text_field(name: "FromEMail").set(email)
b.text_field(name: "ConfirmEMail").set(email)

b.text_field(name: "contact_name").set(name)

b.text_field(name: "PostingTitle").set(title)

b.text_field(name: "Ask").set(price_per_ticket)

b.text_field(name: "postal").set(zip_code)

b.text_field(name: "PostingBody").set(body)

b.text_field(name: "number_available").set(number_of_tickets)

b.button(name: "go").click

b.button(text: "continue").click

b.button(text: "done with images").click

b.button(text: "publish").click

b.button(name: "go").click