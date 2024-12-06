class Affiliation < ApplicationRecord
  acts_as_paranoid

  has_many :categories, dependent: :destroy
  has_many :inventories, through: :categories
end

# == Schema Information
#
# Table name: affiliations
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
