class SessionsController<ApplicationController
  def create
    #raise auth.inspect
    user = User.find_or_create_by(:name => auth['name']) do |user|
      user.uid = auth['info']['uid']
    end
    session[:user_id] = user.try(:id)
  end


    def auth
      request.env['omniauth.auth']
    end
end
