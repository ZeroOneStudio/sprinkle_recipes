package :rails do
  description 'Ruby on Rails'
  requires :ruby
  gem 'rails'
  version '4.2.0'

  verify do
    has_gem 'rails'
  end
end
