require 'watir-webdriver'
b = Watir::Browser.new
b.goto("https://post.craigslist.org/c/sfo")
sleep(rand(3..5))
b.radios[5].set
sleep(rand(5..7))
b.radio(value: "44").set
sleep(rand(3..5))
b.radio(value: "1").set
sleep(rand(3..9))
# TODO: use all radios instead of just first ten
b.radios[rand(0..10)].set
b.text_field(name: "FromEMail").set("xxx@gmail.com")
b.text_field(name: "ConfirmEMail").set("xxx@gmail.com")
b.checkbox(name: "contact_text_ok").set("1")
b.text_field(name: "contact_phone").set("555-555-5555")
b.text_field(name: "contact_name").set("Edwin Lee")
b.text_field(name: "PostingTitle").set("ArtistName Venue Date Number of Tickets")
b.text_field(name: "Ask").set("69")
b.text_field(name: "postal").set("94133")
PBS = ["Suck me","Blow me","Tickle me", "Gross, dude"]
b.text_field(name: "PostingBody").set(PBS[rand(0..2)])
sleep(rand(24..32))
#change sleep time to 240-320
b.text_field(name: "number_available").set("4")
b.button(name: "go").click
sleep(rand(2..3))
b.button(text: "continue").click
b.button(text: "done with images").click
sleep(rand(2..3))
b.button(text: "publish").click
sleep(rand(2..3))
b.button(name: "go").click