User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', role: :admin) if Rails.env.development?
