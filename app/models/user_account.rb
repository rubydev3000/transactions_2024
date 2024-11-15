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
class UserAccount < ApplicationRecord
  # belongs_to :user
  belongs_to :owner, class_name: 'User'
  # belongs_to :owner, class_name: 'User', inverse_of: :user_accounts
  belongs_to :currency

  has_many :payer_operations, class_name: 'Operation', inverse_of: :payer
  has_many :payee_operations, class_name: 'Operation', inverse_of: :payee

  enum :status, { on_moderation: 0, active: 1, blocked: 6, expired: 9 }

  # def user
  #   owner
  # end

  # def owner
  #   user
  # end
end
