class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comments_params)
    comment.book_id = @book.id
    comment.save
    # render :index # redirect_to book_path(book)から書き換え
  end

  def destroy
    @book = Book.find(params[:book_id])
    BookComment.find_by(id: params[:id], book_id: @book.id).destroy
    # render :index # redirect_to book_path(params[:book_id])
  end

  private
  def book_comments_params
    params.require(:book_comment).permit(:comment)
  end

end
