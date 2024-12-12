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
#  affiliation_id :bigint
#  title          :string
#  description    :string
#  deleted_at     :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_sites_on_affiliation_id  (affiliation_id)
#
