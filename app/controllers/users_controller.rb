class UsersController < ApplicationController
  def index
    UsersWorker.perform_async(0,10)
    if params[:status] && params[:status] !="All"
    @users=User.where(status: params[:status]).paginate(:page => params[:page], :per_page => (params[:per_page]&.to_i || 2))

    else
    @users=User.paginate(:page => params[:page], :per_page => (params[:per_page]&.to_i || 2))

    end

        respond_to do |format|
          format.html
          format.json {render json: @users}
        end
  end

  def show
    @user=User.find params[:id]
        respond_to do |format|
          format.html
          format.json {render json: @user}
        end
  end
end
