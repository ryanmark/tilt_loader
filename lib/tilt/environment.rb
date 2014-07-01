module Tilt
  # Environment Class
  # Manages the template setup for this application. Pass a new `Tilt::Loader`
  # object instance to `Tilt::Environment.new`.
  class Environment
    def initialize(loader)
      @loader = loader
      self
    end

    # TODO: Impliment caching here?
    def get_template(name, options={})
      @loader.load name, options
    end
  end
end
