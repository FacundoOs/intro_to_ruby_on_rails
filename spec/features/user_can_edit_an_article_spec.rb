feature 'User can edit an article' do
  let(:user) {FactoryBot.create(:user)}
  let(:article1)  {FactoryBot.create(:article, title: 'sfasdf', content: 'x')} 
  before do
    login_as(user, scope: :user)
    visit article_path(article1)
    click_on "Edit Article"
    fill_in "Content", with: "this is nice"
    click_on "Update Article"
  end

  describe 'User can edit an article' do
    it 'after succesfully update shows a message' do
      expect(page).to have_content 'ok'
    end

    it 'show the updated article' do
      expect(page).to have_content 'this is nice'
    end
  end
end