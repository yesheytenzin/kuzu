require 'rails_helper'

RSpec.describe Vote, type: :model do

  let(:user) { User.create!(username: "KarmaT", email: "karma@mail.com", password_digest: "pass123") }
  let(:post) { Post.create!(user: user, title: 'Title', body: 'Body') }

  it "invalid enum type for vote_type" do
    vote = Vote.new(user: user, votable: post, vote_type: "wrong_vote")
    expect(vote).not_to be_valid
  end

  it "voting with a valid user" do
    vote = Vote.new(user: user, votable: post, vote_type: "upvote")

    expect(vote).to be_valid
  end

  it "voting without a user" do
    vote = Vote.new(user: nil)

    expect(vote).not_to be_valid
  end

  it "voting without a post" do
    vote = Vote.new(user: user, votable: nil)

    expect(vote).not_to be_valid
  end
end
