require 'rspec'
require 'contacts'
require 'Phone_Number'
require 'Email_Address'

describe Contact do
  before do
    Contact.clear
  end

  it 'should create an instance of a contact' do
    test_contact = Contact.new("Angela", "Yen")
    test_contact.should be_an_instance_of Contact
  end

  it 'should give a contact a name' do
    test_contact = Contact.new("Angela", "Yen")
    test_contact.first_name.should eq "Angela"
  end

  it 'should add phone numbers to a contact' do
    test_contact = Contact.new("Maureen", "Dugan")
    test_contact.phone_numbers.class.should eq Array
    test_contact.emails.class.should eq Hash
    test_contact.addresses.class.should eq Hash
  end

  describe '.all' do
    it 'is empty at first' do
      Contact.all.should eq []
    end
  end

  describe '#save' do
    it 'saves a contact to the global array' do
      test_contact = Contact.new('Ernie', 'Dog')
      test_contact.save
      Contact.all.should eq [test_contact]
    end
  end

  describe '.create' do
    it 'creates a new instance of a contact' do
      test_contact = Contact.create('Gog', 'Dog')
      test_contact.should be_an_instance_of Contact
    end

    it 'saves the new contact too' do
      test_contact = Contact.create('Izzy', 'Dog')
      Contact.all.should eq [test_contact]
    end
  end

  describe '#fullname' do
    it 'displays the full name of a contact' do
      test_contact = Contact.new("Maureen", "Dugan")
      test_contact.fullname.should eq "Maureen Dugan"
    end
  end

  describe '.clear' do
    it 'clears the list of contacts' do
      test_contact = Contact.create("Bert", "Reynolds")
      Contact.clear
      Contact.all.should eq []
    end
  end
  describe '#add_number' do
    it 'adds a phone number to the phone number array' do
      test_contact = Contact.new("Bert", "Reynolds")
      test_contact.add_number("5554443333")
      test_contact.phone_numbers.should eq ["5554443333"]
    end
  end
  describe '#add_email' do
    it 'adds an email address to the email hash' do
      test_contact = Contact.new("Bert", "Reynolds")
      test_contact.add_email("personal", "joaubrey@gmail.com")
      test_contact.emails.should eq({ "personal"=>"joaubrey@gmail.com" })
    end
  end
end

describe Phone_Number do
  it "is initialized with a number and the number's type" do
    test_number = Phone_Number.new("home", "555.444.3333")
    test_number.should be_an_instance_of Phone_Number
  end
  it "lets you access the number and type" do
    test_number = Phone_Number.new("home", "555.444.3333")
    test_number.type.should eq "home"
    test_number.number.should eq "555.444.3333"
  end
end
