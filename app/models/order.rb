class Order < ApplicationRecord
  belongs_to :user
  def self.ransackable_attributes(auth_object = nil)
    %w[created_at destination height id length origin price updated_at user_id weight width]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user]
  end
end
