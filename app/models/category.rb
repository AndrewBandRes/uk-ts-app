class Category < ApplicationRecord
  acts_as_paranoid

  belongs_to :affiliation
  has_many :tools, dependent: :destroy
end

# == Schema Information
#
# Table name: categories
#
#  id             :bigint           not null, primary key
#  affiliation_id :bigint
#  title          :string
#  deleted_at     :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_categories_on_affiliation_id  (affiliation_id)
#
