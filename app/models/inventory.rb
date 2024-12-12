class Inventory < ApplicationRecord
  acts_as_paranoid

  belongs_to :user, optional: true
  belongs_to :period
  has_one :organization, through: :period
  belongs_to :site
  belongs_to :tool
  has_one :category, through: :tool
  has_one :affiliation, through: :category
  has_many :transfers_from, class_name: 'Transfer', foreign_key: 'from_inventory_id'
  has_many :transfers_to, class_name: 'Transfer', foreign_key: 'to_inventory_id'
end

# == Schema Information
#
# Table name: inventories
#
#  id            :bigint           not null, primary key
#  user_id       :uuid
#  period_id     :bigint
#  site_id       :bigint
#  tool_id       :bigint
#  opening_stock :integer
#  current_stock :integer
#  deleted_at    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_inventories_on_period_id  (period_id)
#  index_inventories_on_site_id    (site_id)
#  index_inventories_on_tool_id    (tool_id)
#  index_inventories_on_user_id    (user_id)
#
