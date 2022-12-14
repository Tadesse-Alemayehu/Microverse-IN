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
end
