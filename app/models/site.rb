class Site < ApplicationRecord
  acts_as_paranoid

  has_many :inventory_sites, dependent: :destroy
  has_many :inventories, through: :inventory_sites
  has_many :periods, through: :inventory_sites
  has_many :transfers, dependent: :destroy

  def to_s
    title
  end
end

# == Schema Information
#
# Table name: sites
#
#  id          :bigint           not null, primary key
#  deleted_at  :datetime
#  description :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
