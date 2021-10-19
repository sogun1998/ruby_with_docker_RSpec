require 'rails_helper'
# FactoryBot.define do
#   factory :user do
#     name "nguyen duc anh"
#     email "abc@email.com"
#     # association :author
#   end
# end
RSpec.describe User, type: :model do
  describe "Validations" do
    subject { FactoryBot.create(:user, email: "abc@gmail.com", name: "nguyenducanh", password: "abc12345") }

    it "is not valid" do
      is_expected.to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      is_expected.to_not be_valid
    end

    it "is not valid email" do
      subject.email = nil
      is_expected.to_not be_valid
    end
    it "is not valid email too long" do
      subject.email = "a" * 244 + "@example.com"
      is_expected.to_not be_valid
    end
    it "is not valid email too long" do
      subject.email = "a" * 244 + "@example.com"
      is_expected.to_not be_valid
    end
    it "is not valid email regrex" do
      invalid_email = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
      invalid_email.each do |invalid_address|
        subject.email = invalid_address
        is_expected.to_not be_valid
      end
    end
    # it "is not valid duplicate" do
    #   # subject.email = "a" * 244 + "@example.com"
    #   # is_expected.to_not be_valid
    #   duplicate_user = subject.dup
    #   duplicate_user.email = subject.email.upcase
    #   is_expected.to_not be_valid
    # end
    it "is not valid email don't save as downcase" do
      # subject.email = "a" * 244 + "@example.com"

      mixed_case_email = "ssx$65Foo@ExAMPle.CoM"
      user = User.create(email: mixed_case_email, name: "nguyenducanh", password: "abc12345")
      # subject.email = mixed_case_email
      expect(user.errors.messages).to eq({ :email => ["is invalid"] })
    end
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
