class CreatorsController < ApplicationController

  def new
    @creator = Creator.new
  end

  def create
    @creator = Creator.new(creator_params)

    if @creator.save
      redirect_to @creator
    end
  end

  def show

  end

  private
  def creator_params
    params.require(:creator).permit(:name)
  end
end
