class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :prototype
  
  # validates :comment, presence: true
  validates :content, presence: true
end
