# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_commentable, only: %i[create]

  def create
    super
    create_internal
  end

  private

  def create_internal; end

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end
end
