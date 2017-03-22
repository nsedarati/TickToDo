class WelcomeController < ApplicationController
  before_action :require_user
  def index
    @items = current_user.todo_lists(@items)
  end


end
