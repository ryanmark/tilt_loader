module Tilt
  class Environment
    def initialize(loader)
      @loader = loader
      self
    end

    def get_template(name)
      @loader.load name
    end
  end
end
