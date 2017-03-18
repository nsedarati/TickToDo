class TodoListsController < ApplicationController
  before_action :require_user
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  def index
    if logged_in? && current_user.admin?
      @todo_lists = TodoList.all
    else
      # byebug
      @todo_lists = current_user.todo_lists
    end

  end

  def show

  end

  def new
    @todo_list = current_user.todo_lists.new
  end

  def edit


  end

  def create
    # byebug
    @todo_list = current_user.todo_lists.new(todo_list_params)
    if @todo_list.save
      # byebug
      redirect_to @todo_list, notice: 'Todo list was successfully created.'
    else
      render :new
    end
  end

  def update
  if @todo_list.update(todo_list_params)
    # byebug
    redirect_to @todo_list, notice: 'Todo list was successfully updated.'
  else
    render :edit
  end
end


def destroy
  # @todo_list = TodoList.find(params[:id])
  @todo_list.destroy
  redirect_to todo_lists_path , notice: 'Todo list was successfully destroyed.'
end

end



private

def set_todo_list
  # check scope again
  @todo_list = @current_user.todo_lists.find(params[:id])
   # byebug
end

def todo_list_params
  params.require(:todo_list).permit(:title, :user_id)
end