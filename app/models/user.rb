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
class User < ApplicationRecord
  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :user_accounts, foreign_key: :user_id

  validates :email, presence: true, uniqueness: true
  validates :email, uniqueness: { scope: [:deleted_at] }
  validates :name, presence: true
  validates :role, presence: true

  enum :role, { customer: 0, admin: 1 }, suffix: :role

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at email encrypted_password id id_value remember_created_at reset_password_sent_at reset_password_token updated_at]
  end
end
