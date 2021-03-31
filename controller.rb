require_relative 'recipe'
require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    cookbook = @cookbook.all
    @view.display(cookbook)
  end

  def create
    name = @view.ask('name of recipe')
    description = @view.ask('description of recipe')
    recipe = Recipe.new(name, description)
    @cookbook.add(recipe)
  end

  def destroy
    list
    index = @view.ask_index('cookbook you want to delete')
    @cookbook.remove(index - 1)
  end
end
