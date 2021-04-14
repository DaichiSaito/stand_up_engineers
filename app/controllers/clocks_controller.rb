class ClocksController < ApplicationController
    def create
        current_user =  User.find(session[:user_id])
        clock = Clock.new(clock_params)
        clock.user_id = current_user.id
        clock.start_time = Time.now
        clock.save
        redirect_to root_path
    end

    private

    def clock_params
        params.require(:clock).permit(:set_time, :break_time, :category)
    end
end
