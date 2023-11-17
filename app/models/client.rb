class Client < ApplicationRecord
    # Validations
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone, presence: true
    validates :address, presence: true
    validates :preferred_contact, inclusion: { in: %w[Email Phone Both], message: "%{value} is not a valid contact option" }
  
    # Associations
    has_many :orders, dependent: :destroy
  
    # Methods
    def full_name
      "#{first_name} #{last_name}"
    end
  end
  