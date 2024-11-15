# == Schema Information
#
# Table name: user_accounts
#
#  id          :bigint           not null, primary key
#  balance     :decimal(10, 2)   not null
#  status      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  currency_id :bigint           not null
#  owner_id    :bigint           not null
#
# Indexes
#
#  index_user_accounts_on_currency_id  (currency_id)
#  index_user_accounts_on_owner_id     (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_id => currencies.id)
#
require 'rails_helper'

RSpec.describe UserAccount, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
