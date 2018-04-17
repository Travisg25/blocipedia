class Wiki < ApplicationRecord
  belongs_to :user

  has_many :collaborators
  has_many :users, through: :collaborators

  default_scope { order('created_at DESC') }

  def initialize_role
    self.private = false if self.private.nil?
  end
end
