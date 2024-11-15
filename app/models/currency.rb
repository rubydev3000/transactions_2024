# == Schema Information
#
# Table name: currencies
#
#  id           :bigint           not null, primary key
#  abbreviation :string           not null
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_currencies_on_abbreviation  (abbreviation) UNIQUE
#  index_currencies_on_name          (name) UNIQUE
#
class Currency < ApplicationRecord
  has_many :user_accounts
  has_many :operations

  validates :name, presence: true, uniqueness: true
  validates :abbreviation, presence: true, uniqueness: true
end
