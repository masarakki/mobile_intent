module MobileIntent
  module Helpers
    def launch_app(*args, &block)
      if block_given?
        app_name = args.shift
        app_path = args.shift
      else
        text = args.shift
        app_name = args.shift
        app_path = args.shift
      end
      app = MobileIntent.config.apps[app_name.to_sym]
      url = app.launch_url(app_path, request.user_agent)
      options = args.shift
      unless request.user_agent =~ /Android/ && request.user_agent =~ /Chrome/
        options["data-app-scheme"] = app_name
        if options[:class]
          options[:class] += ' launch_app'
        else
          options[:class] = 'launch_app'
        end
      end

      if block_given?
        link_to(url, options, &block)
      else
        link_to(text, url, options)
      end
    end
  end
end
