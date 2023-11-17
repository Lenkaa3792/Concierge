# db/seeds.rb

# Create clients
clients = Client.create([
  { first_name: 'John', last_name: 'Doe', email: 'john@example.com', phone: '123-456-7890', address: '123 Main St', preferred_contact: 'Email' },
  { first_name: 'Jane', last_name: 'Smith', email: 'jane@example.com', phone: '987-654-3210', address: '456 Oak St', preferred_contact: 'Phone' }
])

# Create services
services = Service.create([
  { name: 'Service 1', description: 'Description for Service 1', price: 50.00, duration: 60 },
  { name: 'Service 2', description: 'Description for Service 2', price: 75.00, duration: 90 }
])

# Create orders
orders = Order.create([
  { client: clients.first, service: services.first, order_date: Date.today, status: 'Pending', total_amount: 50.00 },
  { client: clients.last, service: services.last, order_date: Date.today, status: 'Completed', total_amount: 75.00 }
])

puts 'Seed data created successfully!'
