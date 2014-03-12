class Contact
  @@all_contacts = []

  attr_reader :first_name, :last_name, :phone_numbers, :emails, :addresses

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
    @phone_numbers = []
    @emails = {}
    @addresses = {}
  end

  def add_number(new_number)
    @phone_numbers << new_number
  end

  def add_email(type, address)
    @emails.store(type, address)
  end

  def add_address(place, address)
    @addresses.store(place, address)
  end

  def save
    @@all_contacts << self
  end

  def fullname
    @first_name + ' ' + @last_name
  end

end
