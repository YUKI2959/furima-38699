require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品投稿' do
    context '商品投稿できる場合' do
      it 'データを全て正しく入力した場合に登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品投稿できない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_textが空では登録できない' do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item text can't be blank")
      end

      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end

      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.item_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end

      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.ship_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship charge can't be blank")
      end

      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.ship_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day can't be blank")
      end

      it 'item_priceが空では登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end

      it 'item_priceは¥300~¥9,999,999の間のみ保存可能(超過)' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price Price is out of setting range')
      end

      it 'item_priceは¥300~¥9,999,999の間のみ保存可能(不足)' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price Price is out of setting range')
      end

      it 'item_priceは半角数値のみ保存可能' do
        @item.item_price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price Price is invalid. Input half-width characters',
                                                      'Item price Price is out of setting range')
      end

      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
