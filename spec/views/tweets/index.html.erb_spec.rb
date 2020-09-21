require 'rails_helper'

RSpec.describe "tweets/index", type: :view do
  before(:each) do
    assign(:tweets, [
      Tweet.create!(
        tweet: "MyText"
      ),
      Tweet.create!(
        tweet: "MyText"
      )
    ])
  end

  it "renders a list of tweets" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
