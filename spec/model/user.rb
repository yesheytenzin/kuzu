  require 'rails_helper'

  RSpec.describe User, type: :model do
    let(:user) { User.create(username: 'yumiko', email: 'yumiko@senpai.com', password_digest: 'pass123') }
    describe "validation"  do
      it "is valid with username and email" do
        expect(user).to be_valid
      end

      it "is invalid without username" do
        user.username = nil
        expect(user).not_to be_valid
      end

      it "is invalid without email" do
        user.email = nil
        expect(user).not_to be_valid
      end

      it "can have many posts" do
        post1 = user.posts.create!(title: "First", body: "Hello")
        post2 = user.posts.create!(title: "Second", body: "World")
        expect(user.posts).to contain_exactly(post1, post2)
      end
    end
  end
