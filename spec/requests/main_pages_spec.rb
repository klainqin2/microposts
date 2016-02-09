require 'spec_helper'

describe "MainPages" do 
  #let (:base_title) { "Mircoposts Sample App" }
  subject { page }
  
  shared_examples_for "all main pages" do
    it { should have_content(content) }
    it { should have_title(full_title(page_title)) }
  end
  
  describe "Home Page" do
    before { visit root_path }

    let (:content)    { "Welcome to the Microposts Sample App" }
    let (:page_title) { "Home" }
    
    it_should_behave_like "all main pages"
    
    #it { should have_content("Welcome to the Microposts Sample App") }
    #it { should have_title(full_title('Home')) }
    
  	#it "should have the content 'Welcome to the Microposts Sample App'" do
  	#	expect(page).to have_content('Welcome to the Microposts Sample App')
  	#end
  	
  	#it "should have the title 'Home'" do
    #  expect(page).to have_title("#{base_title} | Home")
    #end
  end
  
  describe "Help Page" do
    before { visit help_path }

    let (:content)    { "MainPages#help" }
    let (:page_title) { "Help" }
    
    it_should_behave_like "all main pages"
    
    #it { should have_content("MainPages#help") }
    #it { should have_title(full_title('Help')) }
  end
  
  describe "About Page" do
    before { visit about_path }

    let (:content)    { "MainPages#about" }
    let (:page_title) { "About" }
    
    it_should_behave_like "all main pages"
    
    #it { should have_content("MainPages#about") }
    #it { should have_title(full_title('About')) }
  end

  describe "Contact Page" do
    before { visit contact_path }

    let (:content)    { "MainPages#contact" }
    let (:page_title) { "Contact" }
    
    it_should_behave_like "all main pages"
    
    #it { should have_content("MainPages#contact") }
    #it { should have_title(full_title('Contact')) }
  end
  
  it "should have the right links on the layout" do
		visit root_path
		click_link "About"
		expect(page).to have_title(full_title('About')) 
		#click_link "Help"
		#expect(page).to # fill in
		#click_link "Contact"
		#expect(page).to # fill in
		#click_link "Home"
		#click_link "Sign up now!"
		#expect(page).to # fill in
		#click_link "sample app"
		#expect(page).to # fill in
  end  
end
