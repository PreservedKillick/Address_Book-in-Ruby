class Address

  attr_reader :place, :address

  def initialize(place, address)
    @type = type
    @address = address
  end

  def edit(place, address)

  end

  def create(place, address)
    new_address = Address.new(place, address)
  end


end
