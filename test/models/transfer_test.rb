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
# Foreign Keys
#
#  fk_rails_...  (from_site_id => inventory_sites.id)
#  fk_rails_...  (to_site_id => inventory_sites.id)
#
