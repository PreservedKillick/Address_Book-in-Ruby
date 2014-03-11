require 'rspec'
require 'contacts'

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
    test_contact.phone_number.class.should eq Hash
    test_contact.email.class.should eq Hash
    test_contact.address.class.should eq Hash
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
end
