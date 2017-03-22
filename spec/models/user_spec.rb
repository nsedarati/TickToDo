require 'rails_helper'
require 'spec_helper'


RSpec.describe User, type: :model do
  let(:valid_attributes) {
    {
      first_name: "Niloufar",
      last_name: "Sedarati",
      email: "n.seda@gmail.com"
    }
  }
  context "validations" do
    let(:user) { User.new(valid_attributes) }

    before do
      User.create(valid_attributes)
    end

    it "requires an email" do 
      expect(user).to validate_presence_of(:email)
    end

    it "requires a unique email" do
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires a unique email (case insensitive)" do
      user.email = "N.SEDA@GMAIL.COM"
      expect(user).to validate_uniqueness_of(:email)
    end
    
  end

  describe "#downcase_email" do
    it "makes the email attribute lower case" do
      user = User.new(valid_attributes.merge(email: "N.SEDA@GMAIL.COM"))
      expect{ user.downcase_email }.to change{ user.email }.
        from("N.SEDA@GMAIL.COM").
        to("n.seda@gmail.com")
    end

  end
end
