class Chitter < Sinatra::Base
  get '/comments/new' do
    erb :'comments/new'
  end

  post '/peeps' do
    comment = Comment.create(content: Sanitize.clean(params[:content]), created_at: Time.new)
    current_user.peeps << comment
    current_user.comments << comment
    current_user.save
    redirect '/'
  end

end
