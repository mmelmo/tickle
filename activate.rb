puts "email: "
email = gets.gsub("\n","")

puts "password: "
password = gets.gsub("\n","")

require 'watir-webdriver'
b = Watir::Browser.new
b.goto("gmail.com")
b.text_field(id: "Email").set(email)
b.button(id:"next").click
sleep(5)
b.text_field(id: "Passwd").set(password)
b.button(id: "signIn").click
sleep(5)
b.tr(class:"zA").click
b.div(class: "a3s").divs[0].links[0].click

b.window(title: "SF bay area | create posting").use  do
	b.button(text: "ACCEPT the terms of use").click
end