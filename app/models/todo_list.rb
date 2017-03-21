class TodoList < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy
  validates :title, presence: true
  validates :title, length: { minimum: 3 }

   def is_incomplete_items?
    items.incomplete.size > 0
  end
  
  def is_complete_items?
    items.complete.size > 0
  end

 

end
