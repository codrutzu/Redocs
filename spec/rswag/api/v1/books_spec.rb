# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Books API', type: :request do
  describe 'GET /api/v1/books' do
    path '/api/v1/books' do
      get 'Retrieve the books' do
        tags 'Books'
        produces 'application/json'

        response '200', 'get Books' do
          schema type: :array,
            items: {
              type: :object,
              properties: {
                author: { type: :string },
                title: { type: :string },
                publication_year: { type: :integer }
              },
              required: ['author', 'title', 'publication_year']
            }
          add_examples

          let!(:books) do
            [
              Book.create(author: 'Andrei Codreanu', title: 'Book 1', publication_year: 1999),
              Book.create(author: 'Victor Motogna', title: 'Book 2', publication_year: 2011)
            ]
          end

          run_test!
        end
      end
    end
  end
end
