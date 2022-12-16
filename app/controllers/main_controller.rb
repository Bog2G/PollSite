class MainController < ApplicationController
  def home
    @polls = Poll.all
  end
end
