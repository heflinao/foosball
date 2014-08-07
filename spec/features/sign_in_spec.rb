require 'spec_helper'

feature "signing in" do
	scenario "with email" do
		#user = FactoryGirl.create(:user)
		visit "/users/sign_in"
		fill_in "Email", with: "alex@example.com" 
		fill_in "Password", with: user.password
		click_button "Sign In"
		expect(page).to have_content("Signed in successfully.")
	end

#	scenario "sign in failure" do
#		user = FactoryGirl.create(:user)
#		visit "/users/sign_in"
#		fill_in "Email", with: "alex@gaslight.co"
#		fill_in "Password", with: "heyheyhey123"
#		click_button "Sign In"
#		expect(page).to have_content("Invalid email or password.")
#	end
end
