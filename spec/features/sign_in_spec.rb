require 'spec_helper'

feature "signing in" do
	let(:user) { create(:user) }
	scenario "with email" do
		visit "/"
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		click_button "Sign In"
		expect(page).to have_content("Signed in successfully.")
	end

	scenario "sign in failure" do
		visit "/"
		fill_in "Email", with: "alex@gaslight.co"
		fill_in "Password", with: "heyheyhey123"
		click_button "Sign In"
		expect(page).to have_content("Invalid email or password.")
	end
end
