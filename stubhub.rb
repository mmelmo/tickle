require 'watir-webdriver'
b = Watir::Browser.new :chrome

b.goto("https://www.stubhub.com/my/profile/")

Watir::Wait.until { b.text_field(name: "email-id").visible? }
b.text_field(id: "email-id").set("wan_jordan@yahoo.com")
b.text_field(id: "password").set("125653587Nm")
b.button(text: "Sign in").click

Watir::Wait.until { b.link(id: "sell-tickets").visible? }
b.link(href: "https://sell.stubhub.com/sfr/sell/hub").click
#TODO: (inconsistent error, this may be one solution) 
#b.button(text: "sell tickets").click

Watir::Wait.until { b.text_field(id: "search-input").visible? }
b.text_field(id: "search-input").set("Future San Jose")

b.text_field(id: "search-input").send_keys :enter

Watir::Wait.until { b.checkbox(class: "selectEvent").visible? }
b.div(class: "checkInput").checkbox(class: "selectEvent").set

b.link(id: "start-listing-event").click

Watir::Wait.until { b.div(class: "pdfOff").visible? }
b.div(class: "pdfOff").click

b.link(href: "pdf_upload?ticketMedium=PDF&deliveryMethod=Instant download").click
b.div(id: "uploadTicketInput").click
#upload file step missing
b.link(href: "pdf_reviewseats?ticketMedium=PDF&deliveryMethod=Instant download").click
b.link(href: "pdf_features?ticketMedium=PDF&deliveryMethod=Instant download").click

Watir::Wait.until { b.radio(id: "splitMultipleRadio").visible? }
b.radio(value: "Multiples of").set
s = b.select_list(id: "splitDropDown")
s.select '1'
b.link(href: "disclosures?ticketMedium=PDF&deliveryMethod=Instant download").click

Watir::Wait.until {b.checkbox(id: noneReqDisclosuresCheckBox).visible? }
b.checkbox(id: "noneReqDisclosuresCheckBox").set
b.link(href: "ticket_price?ticketMedium=PDF&deliveryMethod=Instant download").click

Watir::Wait.until {b.text_field(id: pricePerTicketInput).visible? }
b.text_field(id: "pricePerTicketInput").set("69")
b.link(href: "payment?ticketMedium=PDF&deliveryMethod=Instant download").click

Watir::Wait.until {b.div(id: "reviewListTicket").visible? }
b.div(id: "reviewListTicket").click

