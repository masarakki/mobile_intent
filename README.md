# MobileIntent

link to start application.
full of fuck'n shit.

## Installation

Add this line to your application's Gemfile:

    gem 'mobile_intent'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mobile_intent

## Usage

### setup

in config/initializer/mobile_intent.rb

```ruby
MobileIntent.setup do
  register :myscheme, :android => 'com.example.myapp', :ios => 'myappname'
end
```

### link_to

in your view

```ruby
<%= link_to 'open by app', 'myscheme://url_param' %>
```

it create a tag to start application or redirect to store.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
