require "test_helper"

class TransferTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: transfers
#
#  id                :bigint           not null, primary key
#  from_inventory_id :bigint
#  to_inventory_id   :bigint
#  delta             :integer
#  reason            :text
#  note              :text
#  deleted_at        :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_transfers_on_from_inventory_id  (from_inventory_id)
#  index_transfers_on_to_inventory_id    (to_inventory_id)
#
