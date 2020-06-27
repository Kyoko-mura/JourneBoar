class Post < ApplicationRecord
	belongs_to :user
	attachment :image
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
    validates :title, presence: true
    validates :latitude, presence: true
    validates :longitude, presence: true

	# バリデーションの前に送信されたaddressの値によってジオコーディング(緯度経度の算出)を行う
	geocoded_by :address
	before_validation :geocode

    acts_as_taggable

      def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
      end
end
