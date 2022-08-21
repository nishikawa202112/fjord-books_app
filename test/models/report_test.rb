# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'editable?' do
    report = reports(:"alice's_report")
    he = users(:bob)
    me = users(:alice)
    assert_not report.editable?(he)
    assert report.editable?(me)
  end
  test 'created_on' do
    user = users(:alice)
    report = user.reports.create!(title: '夏', content: '暑い')
    assert_equal Time.zone.now.to_date, report.created_on
  end
end
