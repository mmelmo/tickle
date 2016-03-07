require 'watir-webdriver'
b = Watir::Browser.new
b.goto("https://www.stubhub.com/my/profile/")
#TODO: (inconsistent error, this is the solution - waiting until webdriver fixes it)
#b.switchTo().activeElement()
sleep(rand(7..10))
Watir::Wait.until { b.text_field(name: "email-id").visible? }
b.text_field(id: "email-id").set("wan_jordan@yahoo.com")
sleep(rand(0..2))
b.text_field(id: "password").set("125653587Nm")
b.button(text: "Sign in").click
sleep(rand(3..5))
Watir::Wait.until { b.link(id: "sell-tickets").visible? }
b.link(href: "https://sell.stubhub.com/sfr/sell/hub").click
#TODO: (inconsistent error, this may be one solution) 
#b.button(text: "sell tickets").click
sleep(15)
Watir::Wait.until { b.text_field(id: "search-input").visible? }
b.text_field(id: "search-input").set("Future San Jose")
sleep(5)
b.text_field(id: "search-input").send_keys :enter
sleep(8)
Watir::Wait.until { b.checkbox(class: "selectEvent").visible? }
b.div(class: "checkInput").checkbox(class: "selectEvent").set
sleep(rand(0..2))
b.link(id: "start-listing-event").click
sleep(9)
Watir::Wait.until { b.div(class: "pdfOff").visible? }
b.div(class: "pdfOff").click
sleep(rand(0..2))
b.link(href: "pdf_upload?ticketMedium=PDF&deliveryMethod=Instant download").click
b.div(id: "uploadTicketInput").click
#upload file step missing
b.link(href: "pdf_reviewseats?ticketMedium=PDF&deliveryMethod=Instant download").click
b.link(href: "pdf_features?ticketMedium=PDF&deliveryMethod=Instant download").click
sleep(9)
Watir::Wait.until { b.radio(id: "splitMultipleRadio").visible? }
b.radio(value: "Multiples of").set
s = b.select_list(id: "splitDropDown")
s.select '1'
b.link(href: "disclosures?ticketMedium=PDF&deliveryMethod=Instant download").click
sleep(5)
Watir::Wait.until {b.checkbox(id: noneReqDisclosuresCheckBox)visible? }
b.checkbox(id: "noneReqDisclosuresCheckBox").set
b.link(href: "ticket_price?ticketMedium=PDF&deliveryMethod=Instant download").click
sleep(15)
Watir::Wait.until {b.text_field(id: pricePerTicketInput).visible? }
b.text_field(id: "pricePerTicketInput").set("69")
b.link(href: "payment?ticketMedium=PDF&deliveryMethod=Instant download").click
sleep(10)
Watir::Wait.until {b.div(id: "reviewListTicket").visible? }
b.div(id: "reviewListTicket").click

