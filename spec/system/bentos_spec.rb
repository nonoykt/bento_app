require 'rails_helper'

describe '御弁当管理機能', type: :system do
  describe '一覧表示機能' do
    let(:shop_a) { FactoryBot.create(:shop, name: 'shopA', owner: 'ownerA', email: 'a@example.com')}
    let(:shop_b) { FactoryBot.create(:shop, name: 'shopB', owner: 'ownerB', email: 'b@example.com')}

    before do
      FactoryBot.create(:bento, name: 'first bento', shop: shop_a)
      visit login_path
      fill_in 'メールアドレス', with: login_shop.email
      fill_in 'パスワード', with: login_shop.password
      click_button 'ログインする'
    end

    context 'ショップAがログインしているとき' do
      let(:login_shop) { shop_a }

      it 'ショップAが作成したお弁当が表示される' do
        expect(page).to have_content 'first bento'
      end

      context 'ショップBがログインしているとき' do
        let(:login_shop) { shop_b }

        it 'ショップAが作成したおお弁当が表示されない' do
          expect(page).to have_no_content 'first bento'
        end
      end
    end
  end
end
