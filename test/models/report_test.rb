# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'editable?' do
    report = reports(:alices_report)
    he = users(:bob)
    me = users(:alice)
    assert_not report.editable?(he)
    assert report.editable?(me)
  end
  test 'created_on' do
    report = reports(:alices_report)
    assert_equal report.created_at.to_date, report.created_on
  end
end
