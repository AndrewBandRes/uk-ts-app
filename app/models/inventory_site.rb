class InventorySite < ApplicationRecord
  acts_as_paranoid

  belongs_to :inventory
  belongs_to :site
  belongs_to :period
  belongs_to :user, optional: true
  has_many :transfers
end

# == Schema Information
#
# Table name: inventory_sites
#
#  id           :bigint           not null, primary key
#  amount       :integer
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  inventory_id :bigint
#  period_id    :bigint
#  site_id      :bigint
#  user_id      :uuid
#
# Indexes
#
#  index_inventory_sites_on_inventory_id  (inventory_id)
#  index_inventory_sites_on_period_id     (period_id)
#  index_inventory_sites_on_site_id       (site_id)
#  index_inventory_sites_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (inventory_id => inventories.id)
#  fk_rails_...  (period_id => periods.id)
#  fk_rails_...  (site_id => sites.id)
#  fk_rails_...  (user_id => users.id)
#
