class SessionsController < ApplicationController
  
  def new
    
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Ti sei connesso con successo"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "C'era qualcosa di sbagliato nelle tue informazioni"
      render 'nuovo'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] ="Ti sei disconnesso!"
    redirect_to root_path
  end
  
end