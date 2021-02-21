class AssetsController < ApplicationController
    def index
      @name = params.require(:name)
    end
  end