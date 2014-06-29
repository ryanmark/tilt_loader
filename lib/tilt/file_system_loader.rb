require 'tilt/loader'

module Tilt
  # Load templates from the filesystem
  class FileSystemLoader < Loader
    def initialize(searchpath, options={})
      if searchpath.is_a? Array
        @searchpath = searchpath
      else
        @searchpath = [searchpath]
      end
      @options = options
      self
    end

    def get_source(template, options={})
      @searchpath.each do |path|
        filename = File.expand_path File.join(path, template)
        if File.exist? filename
          fp = File.open(filename)
          source = fp.read
          fp.close
          return source
        end
      end
      nil
    end
  end
end
