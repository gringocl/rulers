require "rulers/version"
require 'pry'
module Rulers
  class Application
    def call(env)
      # binding.pry
      'echo debug > debug.txt';
      [200, {'Content-Type' => 'text/html'},
      ["Hello from Rulers!"]]
    end
  end
end
