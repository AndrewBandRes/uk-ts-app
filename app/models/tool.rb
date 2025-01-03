class Tool < ApplicationRecord
  acts_as_paranoid

  belongs_to :category
  has_one :affiliation, through: :category
  has_one :organization, through: :affiliation
  has_many :inventories, dependent: :destroy
  has_many :users, through: :inventories
  has_many :sites, through: :inventories
  has_many :periods, through: :inventories
  has_many :transfers, through: :inventories

  def to_s
    title
  end
end

# == Schema Information
#
# Table name: tools
#
#  id          :bigint           not null, primary key
#  category_id :bigint
#  title       :string
#  deleted_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_tools_on_category_id  (category_id)
#
