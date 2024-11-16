# == Schema Information
#
# Table name: currencies
#
#  id         :bigint           not null, primary key
#  code       :string           not null
#  deleted_at :datetime
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_currencies_on_code        (code) UNIQUE
#  index_currencies_on_deleted_at  (deleted_at)
#  index_currencies_on_name        (name) UNIQUE
#
require 'rails_helper'

RSpec.describe Currency, type: :model do
  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:code) }
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should validate_uniqueness_of(:code).case_insensitive }

  # Soft-delete Scope
  it 'should include only active currencies when not deleted' do
    active_currency = create(:currency, deleted_at: nil)
    deleted_currency = create(:currency, deleted_at: 1.day.ago)

    expect(Currency.where(deleted_at: nil)).to include(active_currency)
    expect(Currency.where(deleted_at: nil)).not_to include(deleted_currency)
  end

  # Database columns
  it { should have_db_index(:code).unique(true) }
  it { should have_db_index(:name).unique(true) }
end
