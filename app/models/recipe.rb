class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :user_recipes
  has_many :users, through: :user_recipes
  validates :name, presence: true
  validates :public_status, presence: true

  def self.find_name(name)
    where("name ILIKE ?", "%#{name}%")
  end

  def self.ingredient_search_details(ingredients)
    require 'pry'; binding.pry
    joins(:ingredients).where(:ingredients => {:name => ingredients })
    joins(:ingredients).where(:ingredients => {:name => "sauce" }).and(Recipe.joins(:ingredients).where(:ingredients => {:name => "pasta" }))
  end
end
