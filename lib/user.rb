require 'bcrypt'

class User

  include BCrypt
  include DataMapper::Resource

  attr_reader :password

  property :id,               Serial
  property :name,             String
  property :email,            String
  property :password_digest,  Text

  def password=(password)
    @password = password.class
    puts @password
    self.password_digest = BCrypt::Password.create(password)
    puts self.password_digest.class
  end

end