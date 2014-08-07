require 'spec_helper'

feature "create new user" do
	scenario "with email" do
		visit new_user_registration_path 
		fill_in "First name", with: "Alex"
		fill_in "Last name", with: "Heflin"
		fill_in "Email", with: "example@example.com"
		fill_in "Password", with: "testtest"
		fill_in "Password confirmation", with: "testtest"
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
