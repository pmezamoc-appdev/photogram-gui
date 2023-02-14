class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:username => :asc})
    render({:template => "user_templates/index.html.erb"})
  end

  def users
    @user_name = params.fetch("user")
    matching_usernames = User.where({:username => @user_name})

    @the_user = matching_usernames.first

    if @the_user == nil
      redirect_to("/404")
    else 
    render({:template => "user_templates/show"})
    end
  end

  def create
    name = params.fetch("input_username")
    new_user = User.new
    new_user.username = name
    new_user.id = rand(1000)
    new_user.save
    redirect_to("/users/" + new_user.username )
  end  

  def update
    user_id = params.fetch("update")
    new_name = params.fetch("input_username")

    user_to_update = User.where({:id => user_id}).first
    user_to_update.username = new_name

    user_to_update.save
    redirect_to("/users/" + user_to_update.username )
  end
end
