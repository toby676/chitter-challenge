class Peep
  include DataMapper::Resource

  has n, :comments

  property :id, Serial
  property :content, String, required: true
  property :created_at, DateTime

  belongs_to :user

end
