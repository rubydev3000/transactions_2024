# == Schema Information
#
# Table name: operations
#
#  id          :bigint           not null, primary key
#  amount      :decimal(10, 2)   not null
#  status      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  currency_id :bigint           not null
#  payee_id    :bigint           not null
#  payer_id    :bigint           not null
#
# Indexes
#
#  index_operations_on_currency_id  (currency_id)
#  index_operations_on_payee_id     (payee_id)
#  index_operations_on_payer_id     (payer_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (payee_id => user_accounts.id)
#  fk_rails_...  (payer_id => user_accounts.id)
#
require 'rails_helper'

RSpec.describe Operation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
