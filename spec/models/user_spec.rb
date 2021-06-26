require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  
  let(:user) { create(:user) }

  describe 'ユーザーのバリデーション' do
    it 'ユーザーの名前が空欄ならユーザーを作成しない' do
     user.name = ""
     expect(user.valid?).to eq(false)
    end

    it 'ユーザーのline_idが空欄ならユーザーを作成しない' do
      user.line_id = ""
      expect(user.valid?).to eq(false)
    end
    
    it 'ユーザーの名前が重複していたら新しいユーザーを作成しない' do
      user_2 = build(:user)
      user_2.name = user.name
      expect(user_2.valid?).to eq(false)
     end
 
     it 'ユーザーのline_idが重複していたら新しいユーザーを作成しない' do
      user_2 = build(:user)
      user_2.line_id = user.line_id
      expect(user_2.valid?).to eq(false)
     end
  end
end