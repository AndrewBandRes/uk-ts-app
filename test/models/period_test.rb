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
#  closed_at       :date
#  deleted_at      :datetime
#  started_at      :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
# Indexes
#
#  index_periods_on_organization_id  (organization_id)
#
