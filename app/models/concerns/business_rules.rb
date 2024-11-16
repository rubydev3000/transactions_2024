module BusinessRules
  extend ActiveSupport::Concern

  included do
    validate :validate_currency
  end

  def validate_currency
    errors.add(:payer_id, 'Wrong currency of operation') && return unless currency_id == payer.currency_id

    errors.add(:payee_id, 'Wrong currency of operation') unless currency_id == payee.currency_id
  end
end
