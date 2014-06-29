# Tilt Loader

The goal of this gem is to provide a consistent API and solve common problems
around loading organizing and loading templates.

I've seen a few ruby projects that all implement their own ways for finding
and loading templates. This gem is meant to be part of the Tilt gem and promote
consistency and code reuse across different web frameworks.

Inspired by Jinja's template loading: http://jinja.pocoo.org/docs/api/#loaders

## Installation

Add this line to your application's Gemfile:

    gem 'tilt_loader'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tilt_loader

## Usage

Here's the five second example:

    require 'tilt/loader'

    env = Tilt::Environment.new(
        Tilt::FileSystemLoader.new([
            'templates', 'shared/templates']))

    template = env.find_template('index.html')
    template.render

You can create your own loader by creating a new class that extends
`Tilt::Loader`, or by passing a block to `Tilt::Loader.new`.

    myloader = Tilt::Loader.new do |template_name, options|
        if template_name == 'index.html'
            'Welcome'
        else
            'go away'
        end
    end

## Contributing

1. Fork it ( https://github.com/ryanmark/tilt_loader/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
