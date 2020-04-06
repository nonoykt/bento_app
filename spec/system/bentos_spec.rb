require 'rails_helper'

describe '御弁当管理機能', type: :system do
  let(:shop_a) { FactoryBot.create(:shop, name: 'shopA', owner: 'ownerA', email: 'a@example.com')}
  let(:shop_b) { FactoryBot.create(:shop, name: 'shopB', owner: 'ownerB', email: 'b@example.com')}
  let!(:bento_a) { FactoryBot.create(:bento, name: 'first bento', shop: shop_a) }

  before do
    visit login_path
    fill_in 'メールアドレス', with: login_shop.email
    fill_in 'パスワード', with: login_shop.password
    click_button 'ログインする'
  end

  shared_examples_for 'ショップAが作成した御弁当が表示される' do
    it { expect(page).to have_content 'first bento' }
  end

  describe '一覧表示機能' do
    context 'ショップAがログインしているとき' do
      let(:login_shop) { shop_a }

      it_behaves_like 'ショップAが作成した御弁当が表示される'
    end

    context 'ショップBがログインしているとき' do
      let(:login_shop) { shop_b }

      it 'ショップAが作成した御弁当が表示されない' do
        expect(page).to have_no_content 'first bento'
      end
    end
  end

  describe '詳細表示機能' do
    context 'ショップAがログインしているとき' do
      let(:login_shop) { shop_a }

      before do
        visit bento_path(bento_a)
      end

      it_behaves_like 'ショップAが作成した御弁当が表示される'
    end
  end

  describe '新規作成機能' do
    let(:login_shop) { shop_a }

    before do
      visit new_bento_path
      fill_in '名称', with: bento_name
      click_button '登録する'
    end

    context '新規作成画面で名称を入力したとき' do
      let(:bento_name) { '新規作成のテストを書く' }

      it '正常に登録される' do
        expect(page).to have_selector '.alert-success', text: '新規作成のテストを書く'
      end
    end

    context '新規作成画面で名称を入力しなかったとき' do
      let(:bento_name) { '' }

      #「名前なし」と出力するようにしたため以下を変更する。
      #it 'エラーとなる' do
        #within '#error_explanation' do
          #expect(page).to have_content '名称を入力してください'
        #end
      #end

      it '名前なしと出力される' do
        expect(page).to have_content '名前なし'
      end
    end
  end
end
