class UsersController < ApplicationController
  def index
    p "_________________________________runing users index_______________________________________________"
    UsersWorker.perform_async()
    @users=User.all.to_a
    # p "User are #{JSON.parse(@users[0].to_json)}"
        respond_to do |format|
          format.html # index.html.erb
          format.json {render json: @users}
        end

  end

  def show
    @name = "James"
  end
end
