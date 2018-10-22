class ReportsController < ApplicationController
  def new
    respond_to :html, :js
  end

  def create
    respond_to do |format|
      format.js { flash.now[:notice] = "Message sent successfully." }
    end
  end
end
