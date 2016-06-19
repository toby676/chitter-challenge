feature 'post comment' do

  let!(:user) do
    User.create(username: 'toby123',
                name: 'Toby m-l',
                email: 'toby@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'can post a comment' do
    sign_in(email: user.email,   password: user.password)
    expect(current_path).to eq('/')
    click_button('Post a new Peep!')
    fill_in :content, with: 'Hello this is a new post'
    click_button 'Submit Peep'
    expect(current_path).to eq('/')
    fill_in :content, with: 'This is a reply'
    click_button 'Comment'
    expect(page).to have_content 'This is a reply'
  end

end
