class Word

  attr_accessor :name, :definitions

  def initialize(options)
    @name = options[:name]
    @definitions = []
  end

end
