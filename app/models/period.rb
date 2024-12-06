class Period < ApplicationRecord
  acts_as_paranoid

  has_many :inventory_sites, dependent: :destroy
  has_many :inventories, through: :inventory_sites
  has_many :categories, through: :inventories
  has_many :affiliations, through: :categories
  has_many :sites, through: :inventory_sites

  scope :current, -> { find_by('periods.started_at <= ? AND (periods.closed_at IS NULL OR periods.closed_at >= ?)', Date.today, Date.today) }
  scope :passed, -> { where.not(closed_at: nil).reorder(:started_at) }
end

# == Schema Information
#
# Table name: periods
#
#  id         :bigint           not null, primary key
#  closed_at  :date
#  deleted_at :datetime
#  started_at :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
