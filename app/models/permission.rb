class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :context, polymorphic: true

  define_singleton_method :available_roles do
    %i[admin].map(&:to_s)
  end

  scope :for_role, ->(role) { where(role: role) }
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
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
