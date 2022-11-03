# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'Ruby超入門'
    fill_in 'メモ', with: 'わかりやすいです。'
    fill_in '著者', with: 'igaiga'
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text 'Ruby超入門'
    assert_text 'わかりやすいです。'
    assert_text 'igaiga'
  end

  test 'updating a book' do
    visit books_url
    click_link '編集', match: :prefer_exact

    fill_in 'タイトル', with: 'Ruby入門'
    fill_in 'メモ', with: 'いつも参考にしています。'
    fill_in '著者', with: '伊藤淳一'
    click_on '更新する'

    assert_text '本が更新されました。'
    assert_text 'Ruby入門'
    assert_text 'いつも参考にしています。'
    assert_text '伊藤淳一'
  end

  test 'destroying a book' do
    visit books_url

    assert_text 'Ruby on Rails 6'
    assert_text 'Web技術の基本'

    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
    assert_no_text 'Ruby on Rails 6'
    assert_text 'Web技術の基本'
  end
end
