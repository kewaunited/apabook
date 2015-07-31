class Account < ActiveRecord::Base
  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true

  has_many :apartments, foreign_key: 'owner_id'

  has_secure_password

  def self.authenticate(email, password)
    account = Account.find_by(email: email)
    account.authenticate(password) if account
  end

  def account_name
    [first_name, last_name].compact.join(' ')
  end

  def apartments?
    apartments.present?
  end
end
