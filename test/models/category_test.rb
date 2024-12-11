require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: categories
#
#  id             :bigint           not null, primary key
#  deleted_at     :datetime
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  affiliation_id :bigint
#
# Indexes
#
#  index_categories_on_affiliation_id  (affiliation_id)
#
