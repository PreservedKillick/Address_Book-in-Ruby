class EmailAddress

  attr_reader :e_type, :e_address

  def initialize(e_type, e_address)
    @e_type = e_type
    @e_address = e_address
  end

  def edit(e_type, e_address)

  end

  def create(e_type, e_address)
    new_eaddress = EmailAddress.new(e_type, e_address)
  end


end
