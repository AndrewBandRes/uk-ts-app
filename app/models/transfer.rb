class Transfer < ApplicationRecord
  acts_as_paranoid

  belongs_to :from_inventory, class_name: 'Inventory', foreign_key: 'id', inverse_of: :to_inventory, optional: true
  belongs_to :to_inventory, class_name: 'Inventory', foreign_key: 'id', inverse_of: :from_inventory, optional: true
end

# == Schema Information
#
# Table name: transfers
#
#  id                :bigint           not null, primary key
#  deleted_at        :datetime
#  delta             :integer
#  note              :text
#  reason            :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  from_inventory_id :bigint
#  to_inventory_id   :bigint
#
# Indexes
#
#  index_transfers_on_from_inventory_id  (from_inventory_id)
#  index_transfers_on_to_inventory_id    (to_inventory_id)
#