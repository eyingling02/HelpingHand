require_relative '../../alchemyapi.rb'

helpers do
    def targeted_sentiment_query(query_text, query_target)
    alchemyapi = AlchemyAPI.new()
    response = alchemyapi.sentiment_targeted('text', query_text, query_target)
    if response['status'] == 'OK'
      puts "Generating response"
      puts JSON.pretty_generate(response)
      if response['docSentiment'].key?('score')
        puts 'score: ' + response['docSentiment']['score']
      end
    else
      puts 'Error in sentiment call: ' + response['statusInfo']
    end
    return response
  end

  def targeted_sentiment_parse(query_response)
    sentiment = query_response['docSentiment']['type']
    score = (query_response['docSentiment']['score'].to_f) * 100
    return { sentiment: sentiment, score: score }
    # return [sentiment, score]
  end


  def sentiment_query(query_text)
    alchemyapi = AlchemyAPI.new()
    response = alchemyapi.sentiment('text', query_text)
    if response['status'] == 'OK'
      puts "Generating response"
      puts JSON.pretty_generate(response)
      if response['docSentiment'].key?('score')
        puts 'score: ' + response['docSentiment']['score']
      end
    else
      puts 'Error in sentiment call: ' + response['statusInfo']
    end
    return response
  end

  def sentiment_parse(query_response)
    sentiment = query_response['docSentiment']['type']
    score = (query_response['docSentiment']['score'].to_f) * 100
    return { sentiment: sentiment, score: score }
    # return [sentiment, score]
  end

  def emotion_query(query_text)
    alchemyapi = AlchemyAPI.new()
    response = alchemyapi.emotion('text', query_text)
    if response['status'] == 'OK'
      puts "Generating response"
      puts JSON.pretty_generate(response)
      if response['docEmotions'].key?('anger')
        # puts 'scores: ' + response['docEmotions']
      end
    else
      puts "Error in emotion call: " + response['statusInfo']
    end
    return response
  end

  def emotion_parse(query_response)
    # DRY This up later with an iteration - map probably
    anger = (query_response['docEmotions']['anger'].to_f) * 100
    disgust = (query_response['docEmotions']['disgust'].to_f) * 100
    fear = (query_response['docEmotions']['fear'].to_f) * 100
    joy = (query_response['docEmotions']['joy'].to_f) * 100
    sadness = (query_response['docEmotions']['sadness'].to_f) * 100
    return { anger: anger, disgust: disgust, fear: fear, joy: joy, sadness: sadness }
  end


  def string_to_hash(post_analysis)
    return eval(post_analysis)
  end
end
