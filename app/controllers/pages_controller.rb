class PagesController < ApplicationController
  def show
    return render file: 'public/404.html', status: :not_found if invalid_page?

    render template: "pages/#{params[:page]}"
  end

  private

  def invalid_page?
    !File.exist? Rails.root.join("app/views/pages/#{params[:page]}.html.erb")
  end
end
