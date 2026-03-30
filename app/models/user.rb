class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, # ... ваши модули
         authentication_keys: [:login]

  attr_accessor :login

  def login
    @login || username || email || phone
  end

  # Метод позволяет искать пользователя по трем полям
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where([
        "lower(username) = :value OR lower(email) = :value OR phone = :value",
        { value: login.downcase }
      ]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email) || conditions.has_key?(:phone)
      where(conditions.to_h).first
    end
  end
end
