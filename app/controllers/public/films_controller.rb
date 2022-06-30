class Public::FilmsController < ApplicationController

  def new
    @film = Film.new
  end

  def create
    @film = Film.new(film_params)
    @film.user_id = current_user.id
    @film.save
    redirect_to public_film_path(@film.id)
  end

  def index
    @film = Film.order("RAND()").limit(10)
    @user = User.find(current_user.id)
  end

  def show
    @film = Film.find(params[:id])
  end

  def destroy
    @film = Film.find(params[:id])
    @film.destroy
    redirect_to public_films_path
  end

  def edit
    @film = Film.find(params[:id])
  end

  def update
    @film = Film.find(params[:id])
    @film.update(film_params)
    redirect_to public_film_path(@film.id)
  end

  private

  def film_params
    params.require(:film).permit(:film_title,:introduction,:body,:user_id,:evaluation)
  end

end