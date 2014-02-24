require 'pry'
class Object
  def self.const_missing(c)
    binding.pry
    return nil if @calling_cont_missing

    @calling_cont_missing = true
    require Rulers.to_underscore(c.to_s)
    klass = Object.const_get(c)
    @calling_cont_missing = false

    klass
  rescue LoadError
    super
  end
end
