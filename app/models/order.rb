class Order < ApplicationRecord
  enum status: { pending: 'Pending', completed: 'Completed', in_progress: 'In Progress' }

  belongs_to :client, dependent: :destroy
  belongs_to :service
  
  has_many :payments
end
