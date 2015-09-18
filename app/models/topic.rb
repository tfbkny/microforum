class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :post
  has_many :comment
end
