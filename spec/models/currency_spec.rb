# == Schema Information
#
# Table name: currencies
#
#  id         :bigint           not null, primary key
#  code       :string           not null
#  deleted_at :datetime
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_currencies_on_code        (code) UNIQUE
#  index_currencies_on_deleted_at  (deleted_at)
#  index_currencies_on_name        (name) UNIQUE
#
require 'rails_helper'

RSpec.describe Currency, type: :model do
  it 'is valid with valid attributes' do
    currency = Currency.new(name: 'rouble', code: 'RUB')
    expect(currency).to be_valid
  end

  it 'is not valid without a name' do
    currency = Currency.new(name: nil, code: 'RUB')
    expect(currency).not_to be_valid
  end

  it 'is not valid without a code' do
    currency = Currency.new(name: 'rouble', code: nil)
    expect(currency).not_to be_valid
  end
end
