# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  deleted_at             :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_deleted_at            (deleted_at)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(email: 'john@example.com', name: 'John Doe', password: 'my_password', role: :admin)
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user = User.new(email: nil, name: 'John Doe', password: 'my_password', role: :admin)
    expect(user).not_to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(email: 'john@example.com', name: nil, password: 'my_password', role: :admin)
    expect(user).not_to be_valid
  end

  it 'is not valid without a password' do
    user = User.new(email: 'john@example.com', name: 'John Doe', password: nil, role: :admin)
    expect(user).not_to be_valid
  end

  it 'is not valid without a role' do
    user = User.new(email: 'john@example.com', name: 'John Doe', password: 'my_password', role: nil)
    expect(user).not_to be_valid
  end
end
