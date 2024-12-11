class Site < ApplicationRecord
  acts_as_paranoid

  belongs_to :affiliation
  has_one :organization, through: :affiliation
  has_many :inventories, dependent: :destroy
  has_many :tools, through: :inventories
  has_many :periods, through: :inventories
  has_many :transfers_from, through: :inventories
  has_many :transfers_to, through: :inventories

  def to_s
    title
  end
end

# == Schema Information
#
# Table name: sites
#
#  id             :bigint           not null, primary key
#  deleted_at     :datetime
#  description    :string
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  affiliation_id :bigint
#
# Indexes
#
#  index_sites_on_affiliation_id  (affiliation_id)
#
