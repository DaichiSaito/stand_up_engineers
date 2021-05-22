require 'rails_helper'

RSpec.describe Clock, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

    let(:user) { create(:user) }
    let(:clock) { create(:clock)}
  
  describe 'clockの基本的なバリデーション' do
    it 'set_timeが空欄ならclockを作成しない' do
     clock.set_time =  ""
     expect(clock.valid?).to eq(false)
    end

    it 'breake_timeが空欄ならclockを作成しない' do
      clock.break_time =  ""
      expect(clock.valid?).to eq(false)
     end

    it 'categoryが空欄ならclockを作成しない' do
      clock.category =  ""
      expect(clock.valid?).to eq(false)
    end
  end

  describe 'set_timeのバリデーション' do
    it 'set_timeが　25,　45,　50,　60分　意外ならclockを作成しない' do
     clock.set_time = 5
     expect(clock.valid?).to eq(false)
    end
  end

  describe 'breake_timeのバリデーション' do
    it 'brake_timeが　5,　10,　15,　30分　意外ならclockを作成しない' do
     clock.set_time = 1
     expect(clock.valid?).to eq(false)
    end
  end
 
  describe 'categoryのバリデーション' do
    it 'categoryが　"筋トレ",　"ストレッチ",　"ヨガ",　"ザ・きんにくTV"　意外ならclockを作成しない' do
     clock.category = "ランニング"
     expect(clock.valid?).to eq(false)
    end
  end

  describe 'userとの関係性を確認する' do
    it 'userが削除されたらclockも削除される' do
    user.destroy
     expect(Clock.count).to eq 0
    end
  end
end
