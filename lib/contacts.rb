class Contact
  @@all_contacts = []

  attr_reader :first_name, :last_name, :phone_number, :email, :address

  def Contact.all
    @@all_contacts
  end

  def Contact.create(first_name, last_name)
    new_contact = Contact.new(first_name, last_name)
    new_contact.save
    new_contact
  end

  def Contact.clear
    @@all_contacts = []
  end

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @phone_number = {}
    @email = {}
    @address = {}
  end

  def save
    @@all_contacts << self
  end

  def fullname
    @first_name + ' ' + @last_name
  end

end
