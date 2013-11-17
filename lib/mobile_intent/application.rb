module MobileIntent
  class Application
    attr_reader :name

    def initialize(name, urls = {})
      @name = name
      @ios = urls[:ios]
      @android = urls[:android]
    end

    def ios? ; !!@ios ; end
    def android? ; !!@android ; end

    def android_intent_url(url)
      raise unless android?
      "intent://#{url}#Intent;scheme=#{name};package=#{@android};end"
    end

    def android_market_url
      raise unless android?
      "market://details?id=#{@android}"
    end

    def ios_market_url
      raise unless ios?
      "itms://itunes.com/apps/#{@ios}"
    end

    def market_url(platform)
      send("#{platform}_market_url")
    end

    def intent_url(url)
      "#{name}://#{url}"
    end

    def launch_url(url, user_agent)
      if user_agent =~ /Chrome/ && user_agent =~ /Android/
        android_intent_url(url)
      else
        intent_url(url)
      end
    end
  end
end
