# == Schema Information
#
# Table name: operations
#
#  id          :bigint           not null, primary key
#  amount      :decimal(10, 2)   not null
#  deleted_at  :datetime
#  planned_at  :datetime
#  status      :integer          not null
#  type        :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  currency_id :bigint           not null
#  payee_id    :bigint           not null
#  payer_id    :bigint           not null
#
# Indexes
#
#  index_operations_on_currency_id  (currency_id)
#  index_operations_on_deleted_at   (deleted_at)
#  index_operations_on_payee_id     (payee_id)
#  index_operations_on_payer_id     (payer_id)
#  index_operations_on_planned_at   (planned_at)
#
# Foreign Keys
#
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (payee_id => user_accounts.id)
#  fk_rails_...  (payer_id => user_accounts.id)
#
class Operation < ApplicationRecord
  acts_as_paranoid
  include BusinessRules

  belongs_to :payer
  belongs_to :payee
  belongs_to :currency

  validates :payer_id, presence: true
  validates :payee_id, presence: true
  validates :payer_id, comparison: { other_than: :payee_id }

  validates :currency_id, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :type, presence: true
  validates :status, presence: true
  validates :planned_at, presence: true, if: :scheduled?
  # validates :planned_at, comparison: { greater_than: :created_at }  ## Возможно и не обязательно IF как на строчке ниже
  validates :planned_at, comparison: { greater_than_or_equal_to: :created_at }, if: :scheduled?

  enum :type, { instant: 0, scheduled: 1 }
  enum :status, { pending: 0, done: 1, cancelled: 2 }

  # Этот метод по-моему тоже необязателен
  def scheduled?
    type == :scheduled
  end
end
