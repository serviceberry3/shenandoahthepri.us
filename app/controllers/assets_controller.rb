class AssetsController < ApplicationController
    def index
        #name parameter is required
      @name = params.require(:name)
    end
  end