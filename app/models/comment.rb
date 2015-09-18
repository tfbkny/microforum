class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  belongs_to :post
  belongs_to :comment
  has_many :comment
end
