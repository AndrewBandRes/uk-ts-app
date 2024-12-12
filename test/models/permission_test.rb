require "test_helper"

class PermissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: permissions
#
#  id           :bigint           not null, primary key
#  user_id      :uuid
#  role         :string
#  context_id   :bigint
#  context_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_permissions_on_user_id  (user_id)
#
