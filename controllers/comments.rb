class Chitter < Sinatra::Base

  post '/comments' do
    comment = Comment.create(content: Sanitize.clean(params[:content]), created_at: Time.new)
    peepid << comment
    current_user.comments << comment
    current_user.save
    peep.save
    redirect '/'
  end

end
