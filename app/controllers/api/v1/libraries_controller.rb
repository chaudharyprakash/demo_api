class Api::V1::LibrariesController < ApplicationController
	def books
    library = Library.find(params[:library_id])
    books_obj = library.books

    render json: { library: library.name, books: books_response(books_obj) }
  end

  private

  def books_response(books_obj)
    books_obj.map do |book|
      {
        id: book.id,
        title: book.title,
        author: book.author,
        status: book.checked_out? ? 'checked_out' : 'available',
        checked_out_by: book.checked_out? ? book.user&.name : nil
      }
    end
  end
end
