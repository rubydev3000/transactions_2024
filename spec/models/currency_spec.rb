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
require 'rails_helper'

RSpec.describe Currency, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
