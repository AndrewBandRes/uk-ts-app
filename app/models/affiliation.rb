class Affiliation < ApplicationRecord
  acts_as_paranoid

  belongs_to :organization
  has_many :categories, dependent: :destroy
  has_many :tools, through: :categories
  has_many :sites
end

# == Schema Information
#
# Table name: affiliations
#
#  id              :bigint           not null, primary key
#  organization_id :bigint
#  title           :string
#  deleted_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_affiliations_on_organization_id  (organization_id)
#
