require 'rails_helper'

RSpec.feature "UserProfiles", type: :feature do
  let(:user) {create(:user)}
   context "User profile page"do
     it "should be on the user_profile page" do
       sign_in user
       visit user_path(user)
       expect(page).to  have_content "Private messaging feature to be implemented"

     end


   end
end
