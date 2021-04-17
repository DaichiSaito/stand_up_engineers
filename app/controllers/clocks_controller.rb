class ClocksController < ApplicationController
    def create
        user =  User.find(session[:user_id])
        clock = Clock.new(clock_params)
        clock.user_id = user.id
         if clock.save
           redirect_to root_path, notice: "アプリを起動しました!"
         else
           redirect_to root_path, danger: "全ての項目を入力してください!"
         end
    end

    private

      def clock_params
          params.require(:clock).permit(:set_time, :break_time, :category)
      end
end
