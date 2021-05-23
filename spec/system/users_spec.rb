require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  pending "add some scenarios (or delete) #{__FILE__}"
   describe "userコントローラーのテスト" do
      describe "userが存在するときの画面表示"  do 

        before 'ユーザーIDをセッションから取り出せるようにする' do
          #session[:user_id]に値を入れユーザーがログインしている状態を作る
          allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: user.id)
        end
        
        it "ユーザーが作成されたら時間とカテゴリー選択画面に切り替える" do
          visit root_path
          #ログインしているユーザーいれば ".line_login" は表示されないはず
          expect(page).to_not have_selector '.line_login'
          expect(page).to have_content 'がんばる時間を設定してください'
         end
    end
   describe "userが存在しない時の画面表示"  do 
      before 'ユーザーIDをセッションから消去する' do
        #session[:user_id]を明示的にからにした状態にする。
        allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: nil)
      end
        it "ユーザーが消去されたら時間と新たにline_loginボタンを表示させる" do
          visit root_path
          #ログインしているユーザーいれば ".line_login" は表示されないはず
          expect(page).to have_selector '.line_login'
          expect(page).to_not have_content 'がんばる時間を設定してください'
        end
    end
  end
end