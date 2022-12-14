class UsersController < ApplicationController
  def index
    p "_________________________________runing users index_______________________________________________"
    UsersWorker.perform_async()
    @users=User.all
    # paginate on what has already been loaded (remove hitting the database more frequently)
    offset=params[:offset]&.to_i || 0
    limit=params[:limit]&.to_i || 2
    p "limit is #{offset} offset is #{offset}"
    @current_user=@users.slice(offset,limit)
        respond_to do |format|
          format.html # index.html.erb
          format.json {render json: @users}
        end
  end

  def show
    @name = "James"
  end
end
