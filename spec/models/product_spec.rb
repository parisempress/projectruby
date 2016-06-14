require 'rails_helper'

describe Product do

  # Create test data
  before do
    # Create a sample product
    @product = Product.create!(name: "Sample Product", description: "This a product!")
    # Create a sample user
    @user = User.create!(first_name: "Example", last_name: "User", email: "example@example.com", password: "Password1", password_confirmation: "Password1")
    # Create sample comments
    @product.comments.create!(rating: 1, user: @user, body: "Awful product!")
    @product.comments.create!(rating: 3, user: @user, body: "An alright product.")
    @product.comments.create!(rating: 5, user: @user, body: "Amazing product!")

  end
  
# Create tests
  it "returns the average rating of all comments" do
    expect(@product.average_rating).to eq 3
  end
it "is not valid" do
    #Create invalid product for validation testing
    expect(Product.new(description:"I'm built to fail!")).not_to be_valid
  end

end