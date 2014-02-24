require "rulers/version"
require 'rulers/routing'
require 'rulers/array'
require 'rulers/util'
require 'rulers/dependencies'
require 'rulers/controller'
require 'pry'

module Rulers
  class Application
    def call(env)
      binding.pry
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type'  => 'text/html'}, []]
      elsif env['PATH_INFO'] == '/'
        klass = Object.const_get('HomeController')
        controller = klass.new(env)
        text = controller.send('index')
        return [200, {'Content-Type' => 'text/html'}, [text]]
      end
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      begin
        text = controller.send(act)
      rescue
      end
      [200, {'Content-Type' => 'text/html'}, [text]]
    end
  end

end
