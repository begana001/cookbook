require_relative 'recipe'
require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @cookbook.all
  end

  def create
    recipe = Recipe.new(name, description)
    @cookbook.add(recipe)
  end

  def destroy
    @cookbook.delete(index)
  end
end
