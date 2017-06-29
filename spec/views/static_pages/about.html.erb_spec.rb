require "rails_helper"

RSpec.describe "static_pages/about.html.erb", type: :view do
  include RSpecHtmlMatchers

  it "has tag" do
    render
    expect(rendered).to have_tag("h1", text: "About Me")
  end
end
