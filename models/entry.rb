class Entry
  attr_accessor :name, :phone_number, :email

  def initialize(name, phone_number, email)
    @name = name
    @phone_number = phone_number
    @email = email
  end

  def to_s
    "Name: #{@name}\nPhone Number: #{@phone_number}\nEmail: #{@email}"
  end

  def is_equal?(other)
    # should I use @name or self.name ?
    (@name == other.name && @phone_number == other.phone_number && @email == other.email)
  end

end
