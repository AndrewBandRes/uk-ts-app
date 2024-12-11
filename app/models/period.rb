class Period < ApplicationRecord
  acts_as_paranoid

  belongs_to :organization
  has_many :inventories, dependent: :destroy
  has_many :tools, through: :inventories
  has_many :sites, through: :inventories
  has_many :users, through: :inventories

  scope :current, -> { find_by('periods.started_at <= ? AND (periods.closed_at IS NULL OR periods.closed_at >= ?)', Date.today, Date.today) }
  scope :passed, -> { where.not(closed_at: nil).reorder(:started_at) }
end

# == Schema Information
#
# Table name: periods
#
#  id              :bigint           not null, primary key
#  closed_at       :date
#  deleted_at      :datetime
#  started_at      :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
# Indexes
#
#  index_periods_on_organization_id  (organization_id)
#
