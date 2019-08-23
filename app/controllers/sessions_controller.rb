class SessionsController < ApplicationController
    def new
    end 

    def create
        if @user = User.find_by(name: params[:session][:name].downcase)
            log_in @user
            flash[:success] = "Login Successful!"
            redirect_to @user
        else 
            flash[:danger] = 'You are not a member'
            render 'new'
        end 

    end 

    def destroy
        log_out
        redirect_to root_url
    end 
end
