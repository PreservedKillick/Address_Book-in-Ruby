require './lib/contacts'
require '.lib/Phone_Number'
require './lib/Email_Address'

system "clear"
def contact_menu
  #system "clear"
  puts "\e[94m\n\n\nBuild Your Address Book\n\n\e[0m"
  puts "Enter 'add' to add a contact to your address book."
  puts "Enter 'show' to show a list of your contacts."
  puts "Enter 'quit' if you've decided you don't want to build an address book.\n\n"
  cm_input = gets.chomp
  case cm_input
  when 'add'
    system 'clear'
    add_contact
  when 'show'
    system 'clear'
    show_contacts
  when 'quit'
    system 'clear'
    puts "No hard feeling.  Have a great day!\n\n"
    exit
  else
    system 'clear'
    puts "I'm sorry, that was not a valid entry.\n"
    contact_menu
  end
end

def add_contact
  system "clear"
  puts "Please enter your contact's \e[91mfirst\e[0m name:\n"
  first_name = gets.chomp

  puts "\nPlease enter your contact's \e[91mlast\e[0m name:\n"
  last_name = gets.chomp

  new_contact = Contact.create(first_name, last_name)
  puts "\e\n[92mYour contact has been added.\n\n\e[0m"
  new_contact_index = Contact.all.rindex(new_contact)
  #show_contacts
  add_details(new_contact_index)
end

def add_details(new_contact_index)
  #system "clear"
  puts "\n\n\nWhat kind of information would you like to add?"
  puts "  Enter 'p' for phone number"
  puts "  Enter 'e' for email"
  puts "  Enter 'a' for address\n\n"
  puts "Or, enter 'menu' to return to the main menu.\n\n"

  ad_input = gets.chomp
  case ad_input
  when 'p'
    puts "\nEnter the phone number:\n"
    phone_input = gets.chomp
    Contact.all[new_contact_index].add_number(phone_input)
    puts "\nNew phone number added.\n\n"
    add_details(new_contact_index)
  when 'e'
    puts "\nEnter the email type:\n"
    emailtype_input = gets.chomp
    puts "\nEnter the email address:\n"
    email_input = gets.chomp
    Contact.all[new_contact_index].add_email(emailtype_input, email_input)
    puts "\nNew email address added.\n\n"
    add_details(new_contact_index)
  when 'a'
    puts "\nEnter the address place (e.g., home, work, etc.):\n"
    add_place = gets.chomp
    puts "\nEnter the address:\n"
    address_input = gets.chomp
    Contact.all[new_contact_index].add_address(add_place, address_input)
    puts "\nNew address added.\n\n"
    add_details(new_contact_index)
  else
    contact_menu
  end
end

def show_contacts
  #system 'clear'
  Contact.all.each_with_index do |contact, index|
    puts (index + 1).to_s + '. ' + Contact.all[index].fullname
  end
      # sorted by last name
  puts "\n\nWhat do you want to do now?"
  puts "   Enter 'add' to add another contact."
  puts "   Enter 'see' to see the details of a contact."
  puts "   Enter 'quit' if you would like to exit the address book."

  sc_input = gets.chomp
  case sc_input
  when 'add'
    system 'clear'
    add_contact
  when 'quit'
    system 'clear'
    puts "No hard feeling.  Have a great day!\n\n"
    exit
  when 'see'
    puts "Enter the number of the contact you would like to see."
    see_input = gets.chomp.to_i
    show_details(see_input - 1)
  else
    #system 'clear'
    puts "I'm sorry, that was not a valid entry."
    contact_menu
  end
end

def show_details(contact_index)
  system 'clear'
  puts Contact.all[contact_index].fullname + "'s Contact Details:"
  puts "\n\n"
  puts "Phone Numbers"
  puts Contact.all[contact_index].phone_numbers
  puts "\nEmail Addresses"
  puts Contact.all[contact_index].emails
  puts "\nMailing Addresses"
  puts Contact.all[contact_index].addresses

  puts "\n\n\n"
  puts "Enter 'add' to add more details to the contact."
  puts "Enter 'menu' to return to the main menu."
  puts "Enter 'quit' if you would like to exit the address book."

  sd_input = gets.chomp
  case sd_input
  when 'add'
    system 'clear'
    add_details(contact_index)
  when 'menu'
    system 'clear'
    contact_menu
  when 'quit'
    system 'clear'
    puts "No hard feeling.  Have a great day!\n\n"
    exit
  else
    puts "I'm sorry, that was not a valid entry."
    show_details(contact_index)
  end
end



# def delete_contact(new_contact_index)

contact_menu
