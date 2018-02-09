-how to add quantity for ingredients!!!!
-authenticity token when deleting an ingredient
-fix case issue with find_or_create_by with ingredients

<%= f.fields_for :ingredients do |ingredients_fields| %>
    <%= ingredients_fields.label :ingredient %>
    <%= ingredients_fields.text_field :name, list: "ingredients_autocomplete" %>
    <datalist id="ingredients_autocomplete">
      <% Ingredient.all.each do |ingredient| %>
      <option value="<%= ingredient.name %>">
        <% end %>
    </datalist>

    <%= ingredients_fields.fields_for :recipe_ingredients do |r| %>
      <%= r.label :quantity %>
      <%= r.text_field :quantity %>
      <br />
      <% end %>
<% end %>


    13: def recipe_ingredients_attributes=(recipe_ingredients_attributes)
 => 14:   binding.pry
    15:   ingredients_attributes.values.each do |ingredient_attribute|
    16:     ingredient = Ingredient.find_or_create_by(ingredient_attribute)
    17:     if !ingredient.name.blank? && !self.ingredients.include?(ingredient)
    18:       self.ingredients << ingredient
    19:     end
    20:   end
    21: end

[1] pry(#<Recipe>)> recipe_ingredients_attributes
=> {"0"=>{"name"=>"chicken", "quantity"=>"1"}}
[2] pry(#<Recipe>)> ingredient_attribute = recipe_ingredients_attributes["0"]
=> {"name"=>"chicken", "quantity"=>"1"}
[3] pry(#<Recipe>)> ingredient = Ingredient.find_or_create_by(name: ingredient_attribute["name"])
  Ingredient Load (0.2ms)  SELECT  "ingredients".* FROM "ingredients" WHERE "ingredients"."name" = ? LIMIT ?  [["name", "chicken"], ["LIMIT", 1]]
   (0.1ms)  begin transaction
  SQL (0.4ms)  INSERT INTO "ingredients" ("name") VALUES (?)  [["name", "chicken"]]
   (0.8ms)  commit transaction
=> #<Ingredient:0x007fcf5cbc0df8 id: 20, name: "chicken">
[4] pry(#<Recipe>)> self
=> #<Recipe:0x007fcf5ddc5b70
 id: nil,
 name: "Chicken",
 description: "food ",
 cook_time: "1",
 servings: 1,
 instructions: "cook",
 user_id: nil,
 meal_id: 1>
[5] pry(#<Recipe>)> self.recipe_ingredients.build(quantity: ingredient_attribute["quantity"], ingredient: ingredient)
=> #<RecipeIngredient:0x007fcf556c1ea8
 id: nil,
 recipe_id: nil,
 ingredient_id: 20,
 quantity: "1">
