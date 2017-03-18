class Item < ActiveRecord::Base
  belongs_to :todo_list
  has_many :photos, dependent: :destroy


  validates :content, presence: true,
    length: { minimum: 2 }

  scope :complete, -> { where("completed_at is not null") }
  scope :incomplete, -> { where(completed_at: nil) }


end
