# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '８月です'
    fill_in '内容', with: '暑いです。'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text '８月です'
    assert_text '暑いです。'
  end

  test 'updating a report' do
    visit reports_url
    click_link '編集', match: :prefer_exact

    fill_in 'タイトル', with: '10月'
    fill_in '内容', with: '涼しくなります。'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text '10月'
    assert_text '涼しくなります。'
  end

  test 'destroying a report' do
    visit reports_url

    assert_text '11月'
    assert_text 'alice'
    assert_text '９月です'
    assert_text 'bob'

    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
    assert_text '９月です'
    assert_text 'bob'
  end
end
