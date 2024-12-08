class Inventory < ApplicationRecord
  acts_as_paranoid

  belongs_to :category
  has_one :affiliation, through: :category
  has_many :inventory_sites, dependent: :destroy
  has_many :sites, through: :inventory_sites
  has_many :periods, through: :inventory_sites
  has_many :transfers, through: :inventory_sites

  def to_s
    title
  end
end

# == Schema Information
#
# Table name: inventories
#
#  id          :bigint           not null, primary key
#  deleted_at  :datetime
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#
# Indexes
#
#  index_inventories_on_category_id  (category_id)
#
