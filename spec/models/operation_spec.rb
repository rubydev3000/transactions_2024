# == Schema Information
#
# Table name: operations
#
#  id           :bigint           not null, primary key
#  amount       :decimal(10, 2)   not null
#  deleted_at   :datetime
#  planned_at   :datetime
#  status       :integer          not null
#  type         :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  currency_id  :bigint           not null
#  recipient_id :bigint           not null
#  sender_id    :bigint           not null
#
# Indexes
#
#  index_operations_on_currency_id   (currency_id)
#  index_operations_on_deleted_at    (deleted_at)
#  index_operations_on_planned_at    (planned_at)
#  index_operations_on_recipient_id  (recipient_id)
#  index_operations_on_sender_id     (sender_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (recipient_id => user_accounts.id)
#  fk_rails_...  (sender_id => user_accounts.id)
#
require 'rails_helper'

RSpec.describe Operation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
