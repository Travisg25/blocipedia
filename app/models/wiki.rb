class Wiki < ApplicationRecord
  belongs_to :user

  def initialize_role
    self.private = false if self.private.nil?
  end
end
