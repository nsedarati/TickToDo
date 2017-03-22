require 'rails_helper'

RSpec.describe Item, type: :model do
   it { should belong_to(:todo_list) }

  describe "#!item.completed_at.blank?" do
    let(:item) { Item.create(content: "Heyyyyy") }

    it "is false when completed_is blank" do
      item.completed_at = nil
      expect(!item.completed_at.blank?).to be false
    end

    it "returns true when completed_at is not empty" do
      item.completed_at = Time.now
      expect(!item.completed_at.blank?).to be true
    end
  end
end
