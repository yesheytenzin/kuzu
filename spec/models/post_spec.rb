require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:valid_user) { User.create!(first_name: "yeshey", last_name: "tenzin", username: "yt", email: "yesheytenzin0@gmail.com", password_digest: "12345") }
  let(:valid_post) { Post.create!(title: "Technology", body: "This is the technology body", user: valid_user) }

  describe "Validations" do
    it "is valid with both title and body" do
      expect(valid_post).to be_valid
    end

    it "invalid for post with no user" do
      valid_post.user = nil
      expect(valid_post).not_to be_valid
    end

    it "invalid with no title" do
      valid_post.title = nil
      expect(valid_post).not_to be_valid
    end

    it "invalid with no body" do
      valid_post.body = nil
      expect(valid_post).not_to be_valid
    end
  end

  describe "Associations" do
    it "belongs to a user" do
      association = Post.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
