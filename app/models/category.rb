class Category < ApplicationRecord
  acts_as_paranoid

  belongs_to :affiliation
  has_many :inventories, dependent: :destroy
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
# Foreign Keys
#
#  fk_rails_...  (affiliation_id => affiliations.id)
#
