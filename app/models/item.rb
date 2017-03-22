class Item < ActiveRecord::Base
  belongs_to :todo_list
  has_many :photos, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?


  validates :content, presence: true,
    length: { minimum: 2 }


  scope :incomplete, -> { where(completed_at: nil) }
  scope :complete, -> { where("completed_at is not null") }



end
