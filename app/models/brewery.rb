class Brewery < ApplicationRecord
	has_many :beers, dependent: :destroy
	has_many :ratings, through: :beers

	def print_report
		puts name
		puts "established at year #{year}"
		puts "number of beers #{beers.count}"
	end

	def restart
		self.year = 2018
		puts "changed year to #{year}"
	end

	def average_rating
		ar = 0.0
		r = self.ratings
		count = 0
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
