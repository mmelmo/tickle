require 'watir-webdriver'
b = Watir::Browser.new
b.goto("https://www.stubhub.com/my/profile/")
#TODO: (inconsistent error, this is the solution - waiting until webdriver fixes it)
#b.switchTo().activeElement()
sleep(rand(0..2))
b.text_field(id: "email-id").set("wan_jordan@yahoo.com")
sleep(rand(0..2))
b.text_field(id: "password").set("125653587Nm")
b.button(text: "Sign in").click
sleep(rand(0..2))
b.link(href: "https://sell.stubhub.com/sfr/sell/hub").click
#TODO: (inconsistent error, this may be one solution) 
#b.button(text: "sell tickets").click
b.text_field(id: "search-input").set("Future San Jose")
sleep(rand(0..2))
b.text_field(id: "search-input").send_keys :enter
b.div(class: "checkInput").checkbox(class: "selectEvent").set
sleep(rand(0..2))
b.link(id: "start-listing-event").click
b.div(class: "pdfOff").click
sleep(rand(0..2))
b.link(href: "pdf_upload?ticketMedium=PDF&deliveryMethod=Instant download").click
b.div(id: "uploadTicketInput").click
