# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books API', type: :request do
  describe 'GET /api/v1/books' do
    let!(:books) do
      [
      Book.create(author: 'Andrei Codreanu', title: 'Book 1', publication_year: 1999),
      Book.create(author: 'Victor Motogna', title: 'Book 2', publication_year: 2011)
      ]
    end

    subject(:get_books_request) { get '/api/v1/books', headers: common_headers }

    context 'when params are valid' do
      it { is_expected.to conform_response_schema(200) }
    end
  end

  describe 'POST /api/v1/books' do
    let(:params) do
      {
        author: 'Florin Ionce',
        title: 'Book 3',
        publication_year: 2003
      }
    end

    subject(:create_book_request) { post '/api/v1/books', params: params.to_json, headers: common_headers }

    context 'when params are valid' do
      it { is_expected.to conform_response_schema(201) }
    end

    context 'when params are invalid' do
      before { params[:publication_year] = 1999 }

      it { is_expected.to conform_response_schema(422) }
    end
  end
end
