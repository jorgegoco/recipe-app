RecipeFood.destroy_all
Food.destroy_all
Recipe.destroy_all
User.destroy_all

# Creating 2 users
jorge = User.create(name: 'jorge', email: 'jorge@gmail.com', password: '123123')
titina = User.create(name: 'titina', email: 'titina@gmail.com', password: '456456')

# Creating foods for jorge
egg = Food.create(name: 'Egg', measurement_unit: 'unit', price: 2, quantity: 10, user_id: jorge.id)
butter = Food.create(name: 'Butter', measurement_unit: '250g', price: 4, quantity: 2, user_id: jorge.id)
cheddar_cheese = Food.create(name: 'Cheddar Cheese', measurement_unit: '125g', price: 1.25, quantity: 2, user_id: jorge.id)
cherry_tomatoes = Food.create(name: 'Cherry Tomatoes', measurement_unit: 'Kg', price: 30, quantity: 0.3, user_id: jorge.id)

# Creating foods for titina
apple = Food.create(name: 'Apple', measurement_unit: 'unit', price: 0.3, quantity: 6, user_id: titina.id)
sugar = Food.create(name: 'Sugar', measurement_unit: 'Kg', price: 2, quantity: 2, user_id: titina.id)
cinnamon = Food.create(name: 'Cinnamon', measurement_unit: 'g', price: 0.1, quantity: 50, user_id: titina.id)
rolled_oats = Food.create(name: 'Rolled Oats', measurement_unit: 'g', price: 0.5, quantity: 200, user_id: titina.id)
butter_titina = Food.create(name: 'Butter', measurement_unit: '250g', price: 4, quantity: 1, user_id: titina.id)

# Creating recipes for jorge

cheese_tomato_omelette_description = "To make this cheese and tomato omelet, you need to beat four eggs in a small bowl and season with salt and pepper. Heat some butter in a large nonstick skillet over medium-high heat and pour in the egg mixture. Cook for about 5 minutes, lifting the edges with a spatula to let the uncooked egg flow underneath. Sprinkle some shredded cheddar cheese and chopped cherry tomatoes over half of the omelet. Fold the other half over the filling and cook for another 5 minutes or until the cheese is melted. Cut into wedges and serve hot or cold."
cheese_tomato_omelette = Recipe.create(name: 'Cheese and Tomato Omelet', preparation_time: '5 min', cooking_time: '10 min', description: cheese_tomato_omelette_description, public: true, user_id: jorge.id)

# Creating recipes for titina

apple_crisp_description = "To make this apple crisp, you need to preheat the oven to 180°C and grease a baking dish. Peel and slice four apples and arrange them in an even layer on the bottom of the dish. Sprinkle some brown sugar and cinnamon over the apples. In a small bowl, mix some rolled oats and melted butter with your fingers until crumbly. Sprinkle the oat mixture over the apple layer. Bake for 30 minutes or until golden and bubbly. Serve hot or cold with whipped cream or ice cream if desired."

apple_crisp = Recipe.create(name: 'Apple Crisp', preparation_time: '10 min', cooking_time: '30 min', description: apple_crisp_description, public: true, user_id: titina.id)

# Creating Recipe Foods
# cheese_tomato_omelette has 4 foods

RecipeFood.create(quantity: 4, recipe: cheese_tomato_omelette, food_id: egg.id)
RecipeFood.create(quantity: 0.05, recipe: cheese_tomato_omelette, food_id: butter.id)
RecipeFood.create(quantity: 0.2, recipe: cheese_tomato_omelette, food_id: cheddar_cheese.id)
RecipeFood.create(quantity: 0.1, recipe: cheese_tomato_omelette, food_id: cherry_tomatoes.id)

# apple_crisp has 5 foods

RecipeFood.create(quantity: 4, recipe: apple_crisp, food_id: apple.id)
RecipeFood.create(quantity: 0.05, recipe: apple_crisp, food_id: sugar.id)
RecipeFood.create(quantity: 5, recipe: apple_crisp, food_id: cinnamon.id)
RecipeFood.create(quantity: 100, recipe: apple_crisp, food_id: rolled_oats.id)
RecipeFood.create(quantity: 0.2, recipe: apple_crisp, food_id: butter_titina.id)
