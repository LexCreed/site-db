class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  scope :ultimos, ->{order("created_at DESC").limit(5)}
end
