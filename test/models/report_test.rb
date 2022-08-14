# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'editable' do
    report = Report.create!(user_id: 2, title: '８月', content: '夏休みです')
    me = User.find_by(email: 'alice@example.com')
    assert report.editable?(me)
  end
  test 'created_on' do
    report = Report.create!(user_id: 1, title: '夏', content: '暑い')
    t = Time.zone.today.strftime('%F')
    assert_equal t, report.created_on.to_s
  end
end
