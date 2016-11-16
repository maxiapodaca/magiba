class Comment < ActiveRecord::Base
	belongs_to :favor
	belongs_to :user
end
