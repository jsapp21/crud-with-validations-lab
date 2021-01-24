class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :genre, presence: true
    validates_uniqueness_of :title, scope: [:artist_name, :release_year]
    validates :released, inclusion: { in: [true, false] }

    with_options if: :released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
          less_than_or_equal_to: Date.today.year
        }
      end
    
      def released?
        released
      end
end
