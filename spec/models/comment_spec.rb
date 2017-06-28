require "rails_helper"

RSpec.describe Comment, type: :model do
  context "association" do
    it {expect belong_to :user}
    it {expect belong_to :post}
  end
end
