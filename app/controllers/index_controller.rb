require './alchemyapi.rb'

# To use the tone analyzer gem, simply call this method and pass in appropriate arguments:

# Easytone::ToneGen.tone(TONE_USERNAME, TONE_PASS, text, version = OPTIONAL)

get '/' do
  erb :index
end

post '/' do
  @post = Post.new(params[:post])
  analysis = sentiment_query(@post.body)
  @post.update(analysis: sentiment_parse(analysis))

  if request.xhr?
    if @post.save
      status 200
      analysis = eval(@post.analysis)
      erb :'_submit', layout: false, locals: { post: @post, analysis: analysis }
    else
      status 422
      @errors = @post.errors.full_messages
    end
  else
    erb :index
  end
end
