class LikesController < ApplicationController
  before_action :set_board

    def create
      @like = current_user.likes.new(board_id: @board.id)
      @like.save
      @likes = Like.where(board_id: @board.id)
    end

    def destroy
      @like = Like.find_by(board_id: @board.id, user_id: current_user.id).destroy
      @likes = Like.where(board_id: @board.id)
    end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end
end
