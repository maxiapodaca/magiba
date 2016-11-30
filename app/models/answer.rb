class Answer < ActiveRecord::Base
	belongs_to :user
	belongs_to :comment
	
	validates :detalle, presence: true, length: { minimum: 2}

	default_scope { order(created_at: :asc) }
end
