require 'csv'

class Cookbook
  def initialize(csv_file_path)
    @cookbook = []
    @csv_file = csv_file_path
    open_csv
  end

  def all
    @cookbook
  end

  def add(recipe)
    @cookbook << recipe
    save_csv
  end

  def remove(index)
    @cookbook.delete_at(index)
    save_csv
  end

  private

  def open_csv
    CSV.foreach(@csv_file) do |row|
      #here, row is an array of columns
      @cookbook << Recipe.new(row[0], row[1], row[2])
    end

  end

  def save_csv
    CSV.open(@csv_file, 'wb')do |csv|
      @cookbook.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating]
      end
    end
  end

end
