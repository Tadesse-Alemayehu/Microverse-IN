require 'rails_helper'

RSpec.describe User, type: :model do
  context "Test use for valid and invalid inputs" do
      before(:each) do
    @hash = {first_name: "first name",last_name: "last name",status: "Inactive", email: "sampleemail@host.com"}
  end

    it "test without a valid first name" do
      @hash.merge!({first_name: ""})
      user=User.new(@hash).save
      expect(user).to eq(false)
    end
    it "test without a valid last name" do
      @hash.merge!({last_name: ""})
      user=User.new(@hash).save
      expect(user).to eq(false)
    end
    it "test without a valid status value" do
      @hash.merge!({status: "something else"})
      user=User.new(@hash).save
      expect(user).to eq(false)
    end
    it "test without a valid email format" do
      @hash.merge!({email: "invalid email address"})
      user=User.new(@hash).save
      expect(user).to eq(false)
    end
    it "test with all valid values" do
      user=User.new(@hash).save
      expect(user).to eq(true)
    end
  end

  context "Test override setters" do
    before(:all) do
        @user = User.create!(first_name: "first name",last_name: "last name",status: "Inactive", email: "sampleemail@host.com")
    end

    it "capitalize the first name" do
      expect(@user["first_name"][0]).to eq('F')
    end
    it "capitalize the last name" do
      expect(@user["last_name"][0]).to eq('L')
    end
  end
end
