class User < ApplicationRecord
  acts_as_paranoid
  devise :database_authenticatable, :registerable, :confirmable, :timeoutable, :trackable, :recoverable, :validatable

  has_many :permissions, dependent: :destroy
  has_many :organizations, -> { where(permissions: { context_type: 'Organization' }) }, through: :permissions
  has_many :affiliations, -> { where(permissions: { context_type: 'Affiliation' }) }, through: :permissions
  has_many :sites, -> { where(permissions: { context_type: 'Site' }) }, through: :permissions
  has_many :inventories

  validates :surname, :name, :email, :encrypted_password, :password_confirmation, presence: true

  def fullname
    [surname, name, patronymic].compact.join(' ').squish
  end

  def shortname
    fullname.gsub(/(?<=\s[А-ЯЁ])[а-яё ]+/, '.')
  end
  alias_method :to_s, :shortname
end

# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  surname                :string           not null
#  name                   :string           not null
#  patronymic             :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  deleted_at             :datetime
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_deleted_at            (deleted_at)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_id                    (id) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
