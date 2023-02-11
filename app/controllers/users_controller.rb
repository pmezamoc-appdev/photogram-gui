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
end
