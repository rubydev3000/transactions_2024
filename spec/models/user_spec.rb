# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  deleted_at             :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_deleted_at            (deleted_at)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  # Validations
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:role) }
  it { should validate_uniqueness_of(:email) }

  # Associations
  it { should have_many(:user_accounts).with_foreign_key(:owner_id) }

  # Database columns
  it { should have_db_index(:email).unique(true) }
  it { should have_db_index(:reset_password_token).unique(true) }

  # Enums
  it { should define_enum_for(:role).with_values(%i[customer admin]) }
end
