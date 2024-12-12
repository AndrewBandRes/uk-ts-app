require "test_helper"

class PeriodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: periods
#
#  id              :bigint           not null, primary key
#  organization_id :bigint
#  started_at      :date
#  closed_at       :date
#  deleted_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_periods_on_organization_id  (organization_id)
#
