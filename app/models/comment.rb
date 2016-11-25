class Comment < ActiveRecord::Base
	belongs_to :favor
	belongs_to :user
	
	validates :detalle, presence: true, length: { minimum: 4}

	default_scope { order(created_at: :desc) }
end
