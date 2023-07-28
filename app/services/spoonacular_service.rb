class SpoonacularService
  def conn
    Faraday.new(url: "https://api.spoonacular.com/recipes/") do |faraday|
      faraday.params["apiKey"] = ENV["SPOON-KEY"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def recipes_by_ingredients(ingr_array)
    search = ingr_array.join(",+")
    get_url("findByIngredients?ingredients=#{search}")
  end
end