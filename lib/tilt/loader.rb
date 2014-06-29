require 'tilt'
require 'tilt/environment'
require 'tilt/loader'
require 'tilt/file_system_loader'
require 'tilt/loader_version'

module Tilt
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
      Tilt[name].new do
        get_source(name, options)
      end
    end

    def get_source(name, options={})
      @block.call(name, options)
    end
  end
end
