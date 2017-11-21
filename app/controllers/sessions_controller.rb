class SessionsController < ApplicationController
   
   def new
   
   end
   
   def create
       user = User.find_by(email: params[:session][:email].downcase)
       
       if user && user.authenticate(params[:session][:password])
       
        #   How do simulate login (save userid to browsers cookie)
           session[:user_id] = user.id
           
           flash[:success] = "You have successfully logged in"
           
        #   direct user to their user show page
           redirect_to user_path(user)
       else
        #   flash is ued only for one HTTP request
           flash.now[:danger] = "There was something wrong with you rlogin information"
           render 'new'
       end
           
   end
   
   def destroy
       session[:user_id] = nil
       flash[:success] = "You have logged out."
       redirect_to root_path
   end
   
   
end