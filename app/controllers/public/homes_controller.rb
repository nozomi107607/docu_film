class Public::HomesController < ApplicationController

  def top
    @films = Film.order(created_at: :desc).limit(4)
    @users = User.all
  end

  def about

  end


end