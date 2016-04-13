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
date = gets.gsub("\n","")

puts "# of tickets: "
number_of_tickets = gets.gsub("\n","")

puts "price per ticket: "
price_per_ticket = gets.gsub("\n","")

puts "additional info: "
additional_info = gets.gsub("\n","")

title = artist + " - " + location + " - " + date + " - " + number_of_tickets + " tickets - $" + price_per_ticket

body_scripts = []
body_scripts << "Selling " + number_of_tickets + " " + artist + " tickets ($" + price_per_ticket + "/ticket) at " + location + " on " + date + ". Accepting Paypal or Venmo!\n" + additional_info
body_scripts << "Friends flaked on me.. Please take these extra tickets off me. I have " + number_of_tickets + " tickets for " + artist + " at " + location + " on " + date + ". \n$" + price_per_ticket + " each. I take paypal or venmo. I can transfer via ticketmaster to ensure a safe and smoothie transaction." + additional_info
body_scripts << "Heyy guys:) Turns out I have " + number_of_tickets + " extra tickets for " + artist + " at " + location + "." + date + ". \n I'm looking for $" + price_per_ticket + " each please. " + " I accept payments through venmo or paypal & can trasnfer via ticketmaster or email if you'd like. Just let me know! :))" + additional_info
body_scripts << "Hi CL! " + " I have " + number_of_tickets + " tickets for " + artist + " at " + location + " on " + date + ". \nI'd like $" + price_per_ticket + " per ticket OBO. I take paypal or venmo. Thanks for reading." + additional_info
body_scripts << "How's it going? I have "  + number_of_tickets + " tickets for " + artist + " at " + location + " on " + date + ". \n I'm asking for $" + price_per_ticket + " each. Only accepting Venmo or Paypal. I can transfer tickets via ticketmaster " + additional_info
body_scripts << "Selling a couple tickets for the sold out " + artist + " show at " + location + " for $" + price_per_ticket + " each. I have " + number_of_tickets + " tickets left. " + " I accept Paypal/ Venmo. " + additional_info

require 'watir-webdriver'
b = Watir::Browser.new
b.goto("https://post.craigslist.org/c/sfo")

sleep(rand(2..5))

b.radio(value: "fso").set

sleep(rand(2..5))

b.radio(value: "44").set

sleep(rand(2..5))

b.radio(value: "1").set

sleep(rand(2..5))

b.radios[rand(0..5)].set

sleep(rand(2..5))

b.text_field(name: "FromEMail").set(email)
b.text_field(name: "ConfirmEMail").set(email)

b.text_field(name: "contact_name").set(name)

b.text_field(name: "PostingTitle").set(title)

b.text_field(name: "Ask").set(price_per_ticket)

b.text_field(name: "postal").set(zip_code)

b.text_field(name: "PostingBody").set(body_scripts[rand(0..5)])

b.text_field(name: "number_available").set(number_of_tickets)

#b.button(name: "go").click

#sleep(rand(2..5))

#b.button(text: "continue").click

#sleep(rand(2..5))

#b.button(text: "done with images").click

#sleep(rand(2..5))

#b.button(text: "publish").click