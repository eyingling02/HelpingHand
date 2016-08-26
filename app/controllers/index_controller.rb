require './alchemyapi.rb'

# To use the tone analyzer gem, simply call this method and pass in appropriate arguments:

# Easytone::ToneGen.tone(TONE_USERNAME, TONE_PASS, text, version = OPTIONAL)

get '/' do
  erb :index
end

post '/' do
  @post = Post.new(params[:post])
  analysis_sentiment = sentiment_query(@post.body)
  analysis_emotion = emotion_query(@post.body)
  @post.update(analysis_sentiment: sentiment_parse(analysis_sentiment))
  @post.update(analysis_emotion: emotion_parse(analysis_emotion))

  if request.xhr?
    if @post.save
      status 200
      analysis_emotion = eval(@post.analysis_emotion)
      analysis_sentiment = eval(@post.analysis_sentiment)
      erb :'_submit', layout: false, locals: { post: @post, analysis_sentiment: analysis_sentiment, analysis_emotion: analysis_emotion }
    else
      status 422
      @errors = @post.errors.full_messages
    end
  else
    erb :index
  end
end
