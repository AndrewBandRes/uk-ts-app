require "test_helper"

class AffiliationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: affiliations
#
#  id              :bigint           not null, primary key
#  deleted_at      :datetime
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
# Indexes
#
#  index_affiliations_on_organization_id  (organization_id)
#
