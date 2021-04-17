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

    def destroy
      user = User.find(params[:id])
      user.clock.destroy
      redirect_to root_path, notice: "アプリを終了しました"
    end

    private

      def clock_params
          params.require(:clock).permit(:set_time, :category)
      end
end
