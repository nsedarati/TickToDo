class TodoList < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :title, length: { minimum: 3 }


end
