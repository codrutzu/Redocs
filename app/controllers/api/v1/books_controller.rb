# frozen_string_literal: true

module Api
  module V1
    class BooksController < ActionController::API
      def index
        render json: BookSerializer.new(Book.all).serialize
      end

      def show
        book = Book.find(params[:id])

        render json: BookSerializer.new(book).serialize
      end

      def create
        head :unprocessable_entity and return if book_params[:publication_year] < 2000

        book = Book.create!(book_params)

        render json: book, status: :created
      end

      def update
        book = Book.find(params[:id])

        render json: book
      end

      private

        def book_params
          params.require(:book).permit(:author, :title, :publication_year)
        end
    end
  end
end
