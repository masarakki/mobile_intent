module MobileIntent
  class Config
    attr_reader :apps

    def initialize
      @apps = {}
    end

    def has?(name)
      @apps.has_key?(name)
    end

    protected
    def register(name, urls = {})
      @apps[name] = Application.new(name, urls)
    end

  end
end
