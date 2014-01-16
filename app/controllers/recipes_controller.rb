class RecipesController < ApplicationController
	def show
		@recipe = Recipe.find(params[:id])
		@ingredients = @recipe.ingredients
	end	

	def edit
		@recipe = Recipe.find(params[:id])
	end

	def new
		@recipe = Recipe.new
    	@recipe.ingredients.build # build ingredient attributes, nothing new here
	end

	def create
		@recipe = Recipe.new(recipe_params)
     #	@recipe.ingredients.build
		if @recipe.save
			flash[:notice] = "Successfully created recipe."
			redirect_to @recipe 
		else
			render 'new'
		end
	end

	def update
		@recipe = Recipe.find(params[:id])
		if params[:add_ingredient]
			# rebuild the ingredient attributes that doesn't have an id
    		unless params[:recipe][:ingredients_attributes].blank?
	 	 		for attribute in params[:recipe][:ingredients_attributes]
	    			@recipe.ingredients.build(attribute.last.except(:_destroy)) unless attribute.last.has_key?(:id)
	  			end
    		end
      	# add one more empty ingredient attribute
      	@recipe.ingredients.build
		end
	end

	private
		def recipe_params
			params.require(:recipe).permit(:title, :directions, :protein, :fat, :carbs, :calories, :cost, :prep_time, :cook_time, ingredients_attributes: [:id, :name, :recipe_id, :amount, :measurement, :_destroy])
		end

end