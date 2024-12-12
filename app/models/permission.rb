class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :context, polymorphic: true
  belongs_to :organization, class_name: 'Organization', foreign_key: 'context_id'
  belongs_to :affiliation, class_name: 'Affiliation', foreign_key: 'context_id'
  belongs_to :site, class_name: 'Site', foreign_key: 'context_id'

  define_singleton_method :available_roles do
    %i[admin manager].map(&:to_s)
  end

  scope :for_role, ->(role) { where(role: role) }
  scope :with_context, -> { where.not(context: nil) }
  scope :for_context, ->(context) { where(context_id: context.try(:id), context_type: context.try(:class)) }

  validates_inclusion_of :role, in: available_roles + available_roles.map(&:to_sym)
  validates_presence_of :role

  validates :user_id, presence: true
  validates(:role, uniqueness: { scope: %i[user_id role context_type context_id] })
  validates(:role, uniqueness: { scope: %i[user_id role], if: ->(item) { item.context.blank? } })
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
