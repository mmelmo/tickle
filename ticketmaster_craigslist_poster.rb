# CREATE CGLIST ADD WITH LATEST TICKETMASTER EVENT

# TODO: 
# - add seats to message body
# - spin text so craigslist thinks ads are unique (jordan /  mel already started this)
# - file with secret values to pull all variables from (ie, ticketmaster_email)

require 'watir-webdriver'

puts "your name: "
name = gets.gsub("\n", "")
puts "zip code: "
zip_code = gets.gsub("\n", "")
puts "ticketmaster email: "
ticketmaster_email = gets.gsub("\n", "")
puts "ticketmaster password: "
ticketmaster_password = gets.gsub("\n", "")
puts "price per ticket: "
price_per_ticket = gets.gsub("\n","")
puts "additional ticket info: "
additional_info = gets.gsub("\n","")
puts "gmail email: "
gmail_email = gets.gsub("\n", "")
puts "gmail password: "
gmail_password = gets.gsub("\n", "")

puts "opening firefox browser..."
b = Watir::Browser.new :firefox
puts "done"

# Sign into ticketmaster and retrieve html
puts "signing into ticketmaster..."
b.goto('https://www.ticketmaster.com/member?tm_link=tm_homeA_header_my_account')
Watir::Wait.until { b.text_field(id: "email").visible? }
b.text_field(id: "email").set(ticketmaster_email)
b.text_field(id: "password").set(ticketmaster_password)
b.button(value: "Sign In").click
puts "done"

# Generate data for craigslist
puts "scraping ticket data..."
Watir::Wait.until { b.link(text: "My Tickets").visible? }
b.link(text: "My Tickets").click
html = b.html

event_name = html.scan(/eventData[^*]+?name":"([^*]+?)"/)[0][0]
location = html.scan(/venueData[^*]+?name":"([^*]+?)"/)[0][0]
date = html.scan(/date":"([^*]+?)"/)[0][0]
number_of_tickets = html.scan(/col2">[^*]+?ticketprice">([^*]+?) Ticket/)[0][0]
title = event_name + " - " + location + " - " + date + " - " + number_of_tickets + " tickets - $" + price_per_ticket
body = "Selling " + number_of_tickets + " " + event_name + " tickets ($" + price_per_ticket + "/ticket) at " + location + " on " + date + ". Accepting Paypal or Venmo!\n" + additional_info
puts "done"

# Post advertisement on craigslist
puts "posting craigslist ad..."
b.goto("https://post.craigslist.org/c/sfo")

sleep(rand(2..5))

b.radio(value: "fso").set

sleep(rand(2..5))

b.radio(value: "44").set

sleep(rand(2..5))

b.radio(value: "1").set

sleep(rand(2..5))

b.radios[rand(0..5)].set

sleep(rand(5..20))

b.text_field(name: "FromEMail").set(gmail_email)
b.text_field(name: "ConfirmEMail").set(gmail_email)

b.text_field(name: "contact_name").set(name)

b.text_field(name: "PostingTitle").set(title)

b.text_field(name: "Ask").set(price_per_ticket)

b.text_field(name: "postal").set(zip_code)

b.text_field(name: "PostingBody").set(body)

b.text_field(name: "number_available").set(number_of_tickets)

b.button(name: "go").click

sleep(rand(2..5))

b.button(text: "continue").click

sleep(rand(2..5))

b.button(text: "done with images").click

sleep(rand(2..5))

b.button(text: "publish").click

puts "done"

# Activating craigslist ad
puts "activating craigslist ad..."

b.goto("gmail.com")
b.text_field(id: "Email").set(gmail_email)
b.button(id:"next").click

sleep(rand(2..5))

b.text_field(id: "Passwd").set(gmail_password)
b.button(id: "signIn").click

sleep(rand(2..5))

b.tr(class:"zA").click
Watir::Wait.until { b.div(class: "a3s").divs[0].links[0].visible? }
b.div(class: "a3s").divs[0].links[0].click

b.window(title: "SF bay area | create posting").use  do
	sleep(rand(2..5))
	b.button(text: "ACCEPT the terms of use").click
end

b.close

puts "done"