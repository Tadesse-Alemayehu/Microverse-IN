class UsersWorker
  include Sidekiq::Worker

  def perform(*)
    p "_________________________________runing perform_______________________________________________"
    url="https://microverse-api-app.herokuapp.com/users"
   response = RestClient.get(url, headers={Authorization: ENV['USERS_API_KEY']})
   p JSON.parse(response.body)
  end
end
