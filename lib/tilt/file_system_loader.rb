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
      if options.fetch(:add_underscore, false)
        base = File.basename(template)
        template = File.join(File.dirname(template), '_' + base)
      end
      if options.fetch(:add_ext, false)
        if options.key? :force_engine
          names = [template + '.' + options[:force_engine]]
        elsif @options.key? :preferred_engine
          names = [
            template + '.' + @options[:preferred_engine],
            template + '.*']
        else
          names = [template + '.*']
        end
      else
        names = [template]
      end

      files = []
      @searchpath.each do |path|
        names.each do |name|
          files << File.expand_path(File.join(path, name))
        end
      end

      found_file = nil
      files.each do |file|
        found_file = Dir[file].find do |matching_file|
          Tilt[matching_file]
        end
        break if found_file
      end

      if found_file
        fp = File.open(found_file)
        source = fp.read
        fp.close
        return source, found_file
      end

      nil
    end
  end
end
