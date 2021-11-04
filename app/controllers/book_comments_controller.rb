class BookCommentsController < ApplicationController
before_action :authenticate_user!

def create
  book = Book.find(params[:book_id])
  comment = current_user.book_comments.new(book_comment_params)
  comment.book_id = book.id
  comment.save
  redirect_to request.referer
end

def destroy
  @book = Book.find(params[:book_id])
  @book_comments = BookComment.find(params[:book_comment_id])
  @book_comments.destroy
end

private

def book_comment_params
  params.require(:book_comment).permit(:comment)
end

end
