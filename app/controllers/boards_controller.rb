class BoardsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_board, only: [:show, :edit, :update, :destroy]

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

  def show
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if @board.destroy
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :information, :genre_id, :image).merge(user_id: current_user.id)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
