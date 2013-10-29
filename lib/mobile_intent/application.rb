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

  end
end
