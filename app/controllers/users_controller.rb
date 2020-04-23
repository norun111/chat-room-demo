class UsersController < ApplicationController
  def top
    @creators = Creator.all
  end
end
