feature 'User can log in' do
  let(:user) {FactoryBot.create(:user)}
  
  context "Can sign up or log in" do
  it 'user can sign up' do
    expect(user.email).to eq 'user1@mail.com'
  end

  it 'user can sign in' do
    login_as(user, scope: :user)
    visit root_path
    expect(page).to have_content 'New Article'
  end

  it 'user can log out' do
    logout
    visit root_path
    expect(page).to have_content 'Sign in'
  end
end

  #Sad path
  context "Can not sign up " do
    before do
    visit root_path
    click_on 'Sign up'
    fill_in "user_email", with: "user2@mail.com"
    click_on 'Sign up'
    end

    it 'user can not sign up' do
    expect(page).to have_content "Password can't be blank"
    end
  end

  context "Can not log in" do
    before do
      visit root_path
      click_on 'Sign in'
      fill_in "user_email", with: "user2@mail.com"
      click_on 'Log in'
    end
    it 'user can not sign in' do
      expect(page).to have_content "Invalid Email or password."
    end
  end

end
