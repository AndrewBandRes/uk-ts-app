class Transfer < ApplicationRecord
  acts_as_paranoid

  belongs_to :to_site, class_name: 'InventorySite', inverse_of: :from_site, optional: true
  belongs_to :from_site, class_name: 'InventorySite', inverse_of: :to_site, optional: true
end

# == Schema Information
#
# Table name: transfers
#
#  id           :bigint           not null, primary key
#  deleted_at   :datetime
#  delta        :integer
#  note         :string
#  reason       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  from_site_id :bigint
#  to_site_id   :bigint
#
# Indexes
#
#  index_transfers_on_from_site_id  (from_site_id)
#  index_transfers_on_to_site_id    (to_site_id)
#
