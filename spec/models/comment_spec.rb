require "rails_helper"

RSpec.describe Comment, type: :model do
  let(:user) do User.new(username: "dendup", email: "dendup@123.com", password_digest: "1234") end
  let(:post) do Post.new(title: "title1", body: "body1") end

  it "Comment invalid without the user" do
    comment = Comment.new(body: "body1", user: nil, post:)

    expect(comment).not_to be_valid
    expect(comment.errors[:user]).to include("must exist")
  end

  it "Comment invalid without the post" do
    comment = Comment.new(body: "body1", user:, post: nil)

    expect(comment).not_to be_valid
    expect(comment.errors[:post]).to include("must exist")
  end
end
