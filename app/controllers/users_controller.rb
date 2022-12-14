class UsersController < ApplicationController
  def index
    p "_________________________________runing users index_______________________________________________"
    UsersWorker.perform_async()
  end

  def show
    @name = "James"
  end
end
