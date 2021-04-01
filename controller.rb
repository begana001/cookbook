require_relative 'recipe'
require_relative 'view'
require_relative 'parsing'

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

  def find
    ingredient = @view.ask('name of recipe')
    parsing = Parsing.new(ingredient)
    result = parsing.call
    @view.display(result)
    index = @view.ask_index('index of the recipe do you want to add')
    recipe = result[index-1]
    @cookbook.add(recipe)
  end
end
