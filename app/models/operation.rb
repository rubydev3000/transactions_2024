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
class Operation < ApplicationRecord
  acts_as_paranoid
  include BusinessRules

  belongs_to :sender
  belongs_to :recipient
  belongs_to :currency

  validates :sender_id, presence: true
  validates :recipient_id, presence: true
  validates :sender_id, comparison: { other_than: :recipient_id }

  validates :currency_id, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :type, presence: true
  validates :status, presence: true
  validates :planned_at, presence: true, if: :scheduled?
  # validates :planned_at, comparison: { greater_than: :created_at }  ## Возможно и не обязательно IF как на строчке ниже
  validates :planned_at, comparison: { greater_than_or_equal_to: :created_at }, if: :scheduled?

  enum :type, { immediate: 0, scheduled: 1 }
  enum :status, { pending: 0, done: 1, cancelled: 2 }

  scope :active, -> { where(deleted_at: nil) }

  # Этот метод по-моему тоже необязателен
  def scheduled?
    type == :scheduled
  end
end
