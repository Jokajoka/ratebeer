class Beer < ApplicationRecord
	belongs_to :brewery
	has_many :ratings

	def average_rating
		ar = 0.0
		count = 0
		r = self.ratings
		r.each do |rating|
			ar += rating.score
			count += 1
		end		   
		if count != 0
			return ar / count
		else
			return 0.0
		end
	end
end
