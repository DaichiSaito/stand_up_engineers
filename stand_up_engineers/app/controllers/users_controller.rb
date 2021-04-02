class UsersController < ApplicationController
    def create
     @user = User.new(user_params)
     @user.start_time = Time.now
     if @user.save
        session[:user_id] = @user.id
        @current_user = User.find(session[:user_id])
        redirect_to root_path
     else
        render root_path
     end 
    end
    
    def destroy
        user = User.find(params[:id])
        user.destroy
        @current_user = nil
        session.delete(:user_id)
        redirect_to root_path
    end
    private

    def user_params
        params.require(:user).permit(:name, :email, :set_time, :break_time)
    end
end
