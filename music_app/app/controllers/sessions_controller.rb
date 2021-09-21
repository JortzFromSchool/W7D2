def SessionsController < ApplicationController

    before_action :require_logged_out, only: [:new, :create]
    # we dont want users who are logged in to try to login again
    before_action :require_logged_in, only: [:destroy]
    # we only want logged in users to logout

    def new
        @user = User.new
        #implicit render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        
        if @user
            login(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = ['Invalid credentials']
            render :new
        end
    end

    def destroy
        if logged_in?
            logout!
        end

        flash[:success] = ['Successfully logged out']
        redirect_to new_session_url
    end
end