require 'rails_helper'
FactoryBot.define do
  factory :user do
    name {"my first author"}
    email {"abc@gmail.com"}
  end
end

FactoryBot.define do
  factory :micropost do
    content {"my first book title"}
    # description "my first book description"
    user_id {:user}
  end
end
# RSpec.describe "UsersController", type: :controller do
#   # describe "GET /index" do
#   #   pending "add some examples (or delete) #{__FILE__}"
#   # end
#   describe "POST #create" do
#     context "with valid attributes" do
#       it "create new user" do
#         post :create, user: attributes_for(:user)
#         expect(User.count).to eq(1)
#       end
#     end
#   end
# end
RSpec.describe Micropost, type: :model do
  describe "Associations" do
    subject { build(:micropost) }
    # it "belongs to user" do
    #   association = described_class.reflect_on_association(:user)
    #   expect(association.macro).to eq :belongs_to
    # end
    it { should validate_presence_of(:content)}
    it { should belong_to(:user)}
    # it { should validate_presence_of(:user_id)}
  end
end
RSpec.describe User, type: :model do
  describe "Associations" do
    subject { build(:user) }
    # it "belongs to user" do
    #   association = described_class.reflect_on_association(:user)
    #   expect(association.macro).to eq :belongs_to
    # end
    it { should validate_presence_of(:content)}
    it { should belong_to(:user)}
    # it { should validate_presence_of(:user_id)}
  end
end