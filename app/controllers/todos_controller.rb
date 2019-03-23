class TodosController < ApplicationController
	before_action :set_todo, only: [:show, :update, :destroy]

	# GET /todos
	def index
		@todos = Todo.all
		json_response(@todos)
	end

	# POST /todos
	def create
		@todo = Todo.create!(todo_params)
		json_response(@todo, :created)
	end

	# GET /todos/:id
	def show
		# NOTE: `json_response` is a custom helper to respond with JSON and an HTTP status code (200 by default)
			# defined in app/controllers/concerns/response
		json_response(@todo)
	end

	# PUT /todos/:id
	def update
		@todo.update(todo_params)
	end

	# DELETE /todos/:id
	def destroy
		@todo.destroy
		head :no_content
	end

	private 
	
	def todo_params
		# whitelist params (strong params)
		params.permit(:title, :created_by)
	end

	def set_todo
		@todo = Todo.find(params[:id])
	end

end
