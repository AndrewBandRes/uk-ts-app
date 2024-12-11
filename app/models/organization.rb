class Organization < ApplicationRecord
  acts_as_paranoid

  has_many :affiliations
  has_many :sites, through: :affiliations
  has_many :categories, through: :affiliations
  has_many :tools, through: :categories
  has_many :periods
  has_many :inventories, through: :periods
  has_many :permissions, as: :context, dependent: :destroy
  has_many :users, through: :permissions
end

# == Schema Information
#
# Table name: organizations
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
