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

# RSpec.describe Operation, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe Operation, type: :model do
  # Validations
  it { should validate_presence_of(:sender_id) }
  it { should validate_presence_of(:recipient_id) }
  it { should validate_presence_of(:currency_id) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:status) }

  # Associations
  it { should belong_to(:sender).class_name('UserAccount') }
  it { should belong_to(:recipient).class_name('UserAccount') }
  it { should belong_to(:currency) }

  # Custom validations
  it 'should validate sender and recipient are different' do
    account = create(:user_account)
    operation = Operation.new(sender: account, recipient: account)

    expect(operation.valid?).to be_falsey
    expect(operation.errors[:recipient_id]).to include('cannot be the same as sender')
  end

  # Enums
  it { should define_enum_for(:type).with_values(%i[deposit withdrawal transfer]) }
  it { should define_enum_for(:status).with_values(%i[pending completed failed]) }

  # Scopes
  it 'includes operations scheduled in the future with planned scope' do
    future_op = create(:operation, planned_at: 1.day.from_now)
    past_op = create(:operation, planned_at: 1.day.ago)

    expect(Operation.where('planned_at > ?', Time.current)).to include(future_op)
    expect(Operation.where('planned_at > ?', Time.current)).not_to include(past_op)
  end

  # Database columns
  it { should have_db_index(:sender_id) }
  it { should have_db_index(:recipient_id) }
  it { should have_db_index(:currency_id) }
end
