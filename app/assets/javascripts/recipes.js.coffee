# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@calculateCalories = () ->
	carbs = document.getElementById('recipe_carbs').value
	protein = document.getElementById('recipe_protein').value
	fat = document.getElementById('recipe_fat').value
	calories = (4 * carbs) + (4 * protein) + (9 * fat)
	document.getElementById('recipe_calories').value = calories	
