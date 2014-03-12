class PhoneNumber

  attr_reader :type, :number

  def initialize(type, number)
    @type = type
    @number = number
  end

  def edit(type, number)

  end

  def create(type, number)
    new_phone = PhoneNumber.new(type, number)
  end


end

