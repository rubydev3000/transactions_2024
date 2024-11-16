module BusinessRules
  extend ActiveSupport::Concern

  included do
    validate :validate_currency
  end

  def validate_currency
    errors.add(:sender_id, 'Wrong currency of operation') && return unless currency_id == sender.currency_id

    errors.add(:recipient_id, 'Wrong currency of operation') unless currency_id == recipient.currency_id
  end
end
