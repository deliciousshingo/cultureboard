class BoardsController < ApplicationController

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :information, :genre_id, :image).merge(user_id: current_user.id)
  end

end
