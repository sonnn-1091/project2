require "rails_helper"

RSpec.describe Post, type: :model do
  context "association" do
    it {expect have_many :tags}
    it {expect have_many :comments}
    it {expect belong_to :user}
  end
end
