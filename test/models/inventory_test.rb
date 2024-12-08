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
