feature 'User can edit an article' do
  let(:user) {FactoryBot.create(:user)}
  let(:article1)  {FactoryBot.create(:article)} 
  before do
    login_as(user, scope: :user)
    visit article_path(article1)
    click_on "Edit article"
  end

  describe 'User can edit an article' do
    it 'after succesfully update shows a message' do
      expect(page).to have_content 'Updated'
    end

    it 'show the updated article' do
      expect(page).to have_content 'MyText'
    end
  end
end