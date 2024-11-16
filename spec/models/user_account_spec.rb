# == Schema Information
#
# Table name: user_accounts
#
#  id          :bigint           not null, primary key
#  balance     :decimal(10, 2)   not null
#  deleted_at  :datetime
#  status      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  currency_id :bigint           not null
#  owner_id    :bigint           not null
#
# Indexes
#
#  index_user_accounts_on_currency_id  (currency_id)
#  index_user_accounts_on_deleted_at   (deleted_at)
#  index_user_accounts_on_owner_id     (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_id => currencies.id)
#
require 'rails_helper'

# RSpec.describe UserAccount, type: :model do
#   # describe "associations" do
#   #   it { should belong_to(:owner) }
#   # end

#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe UserAccount, type: :model do
  # Validations
  it { should validate_presence_of(:owner_id) }
  it { should validate_presence_of(:currency_id) }
  it { should validate_presence_of(:balance) }
  it { should validate_presence_of(:status) }

  # Associations
  it { should belong_to(:owner).class_name('User') }
  it { should belong_to(:currency) }

  # Scopes
  describe 'deleted scope' do
    it 'includes only active accounts' do
      active_account = create(:user_account, deleted_at: nil)
      deleted_account = create(:user_account, deleted_at: 1.day.ago)

      expect(UserAccount.where(deleted_at: nil)).to include(active_account)
      expect(UserAccount.where(deleted_at: nil)).not_to include(deleted_account)
    end
  end

  # Database columns
  it { should have_db_index(:owner_id) }
  it { should have_db_index(:currency_id) }
end
