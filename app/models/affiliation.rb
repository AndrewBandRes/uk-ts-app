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
