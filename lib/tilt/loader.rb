require 'tilt'
require 'tilt/environment'
require 'tilt/loader'
require 'tilt/file_system_loader'
require 'tilt/loader_version'

module Tilt
  # Loader class
  # This class describes how to load templates. You can extend this class to
  # implement your own way to load templates. Sub-classes should override
  # `initalize` and `get_source`. You can also create a custom Loader instance
  # by passing a block to `Loader.new` that accepts a template name string and
  # a hash of options.
  class Loader
    def initialize(&block)
      if block.nil?
        fail ArgumentError, 'You must specify a block that accepts a template '\
          'name and options and returns the template source'
      end
      @block = block
      self
    end

    def load(name, options={})
      source, type_or_filename = get_source(name, options)
      type_or_filename = options[:force_engine] if options.key?(:force_engine)
      Tilt[type_or_filename].new do
        source
      end
    end

    def get_source(name, options={})
      @block.call(name, options)
    end
  end
end
