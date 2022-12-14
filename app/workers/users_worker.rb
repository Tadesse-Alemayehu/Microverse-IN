class UsersWorker
  include Sidekiq::Worker

  def perform(*)
    url="https://microverse-api-app.herokuapp.com/users"
    response = RestClient.get(url, headers={Authorization: ENV['USERS_API_KEY']})
    if response.code==200
          user_data = JSON.parse(response.body)
          User.create!(user_data)
    end
  end
end
