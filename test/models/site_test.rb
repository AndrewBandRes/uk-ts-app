require "test_helper"

class SiteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: sites
#
#  id             :bigint           not null, primary key
#  deleted_at     :datetime
#  description    :string
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  affiliation_id :bigint
#
# Indexes
#
#  index_sites_on_affiliation_id  (affiliation_id)
#
