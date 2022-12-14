class UsersController < ApplicationController
  def index
    UsersWorker.perform_async()
    if params[:status] && params[:status] !="All"

    @users=User.where(status: params[:status]).paginate(:page => params[:page], :per_page => params[:limit] || 2)
    p @users.length
    else
    @users=User.paginate(:page => params[:page], :per_page => params[:limit]||2)
p @users.length
    end

        respond_to do |format|
          format.html # index.html.erb
          format.json {render json: @users}
        end
  end

  def show
    @name = "James"
  end
end
