require './lib/contacts'


system "clear"

def contact_menu
  system "clear"

  input = gets.chomp

  case input
  when 'a'
    # add_contact
  # when 'show'
  #   # show list of contacts
  # when Fixnum
  #   # show_contact(index_number) with that index
  else
    contact_menu
  end


end




# def show_contact(index_number)
#   case input
#   when 'p'
#     add_phone
#   when 'e'
#     add_email
#   else
#     contact_menu
#   end
# end
