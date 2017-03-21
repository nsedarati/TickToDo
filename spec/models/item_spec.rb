require 'rails_helper'

RSpec.describe Item, type: :model do
   it { should belong_to(:todo_list) }

  describe "#completed?" do
    let(:item) { Item.create(content: "Heyyyyy") }

    it "is false when completed_is blank" do
      item.completed_at = nil
      expect(item.completed?).to be_false
    end

    it "returns true when completed_at is not empty" do
      item.completed_at = Time.now
      expect(item.completed?).to be_true
    end
  end
end
