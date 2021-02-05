class PagesController < ApplicationController
  def car
  end

  def show
    render template: "pages/#{params[:page]}"
  end
end
