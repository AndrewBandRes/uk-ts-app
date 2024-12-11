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
#  context_type :string
#  role         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  context_id   :bigint
#  user_id      :uuid
#
# Indexes
#
#  index_permissions_on_user_id  (user_id)
#
