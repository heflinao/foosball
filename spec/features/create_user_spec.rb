require 'spec_helper'

feature "create new user" do
	let(:user) { create(:user) }
	scenario "with email" do
		visit new_user_registration_path 
		fill_in "First name", with: user.first_name
		fill_in "Last name", with: user.last_name
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		fill_in "Password confirmation", with: user.password
		click_button "Sign Up"
		expect(page).to have_content("Welcome! You have signed up successfully.")
	end
end

feature "failure to create user" do
	scenario "password mismatch" do
		visit new_user_registration_path 
		fill_in "First name", with: "Lola" 
		fill_in "Last name", with: "Rabbit" 
		fill_in "Email", with: "lola@example.com"
		fill_in "Password", with: "heyheyhey123"
		fill_in "Password confirmation", with: "heheyhey123"
		click_button "Sign Up"
		expect(page).to have_content("1 error prohibited this user from being saved:
Password confirmation doesn't match Password")
	end
end
