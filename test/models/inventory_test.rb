require "test_helper"

class InventoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
