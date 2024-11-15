# Generate Users
admin = User.find_or_initialize_by(email: 'admin@example.com')
admin.update(
  password: 'password',
  password_confirmation: 'password',
  role: :admin,
  name: 'Admin Adminson',
)

user1 = User.find_or_initialize_by(email: 'user1@example.com')
user1.update(
  password: 'password',
  password_confirmation: 'password',
  role: :user,
  name: 'John Doe',
)

user2 = User.find_or_initialize_by(email: 'user2@example.com')
user2.update(
  password: 'password',
  password_confirmation: 'password',
  role: :user,
  name: 'Mary Smith',
)


# Generate currencies
euro = Currency.find_or_initialize_by(abbreviation: 'EUR')
euro.update(
  name: 'Euro',
  abbreviation: 'EUR',
)

usd = Currency.find_or_initialize_by(abbreviation: 'USD')
usd.update(
  name: 'United States dollar',
  abbreviation: 'USD',
)


# Generate User Accounts
acc11 = UserAccount.create(
  owner: user1,
  currency: euro,
  balance: 10000.0,
  status: :active,
)

acc12 = UserAccount.create(
  owner: user1,
  currency: usd,
  balance: 666,
  status: :active,
)

acc21 = UserAccount.create(
  owner: user2,
  currency: euro,
  balance: 5000.0,
  status: :active,
)

acc22 = UserAccount.create(
  owner: user2,
  currency: usd,
  balance: 0,
  status: :active,
)

acc23 = UserAccount.create(
  owner: user2,
  currency: usd,
  balance: 4500.15,
  status: :active,
)

# Generate Operations
# op1 = Operation.create(
#   amount: 550,
#   currency: usd,
#   payer_: acc11,
#   payee: acc21,
#   status: done,
# )

