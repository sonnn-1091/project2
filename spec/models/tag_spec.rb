require "rails_helper"

RSpec.describe Tag, type: :model do
  context "association" do
    it {expect have_many :posts}
  end
end
