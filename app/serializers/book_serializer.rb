# frozen_string_literal: true

class BookSerializer < ApplicationSerializer
  attributes :author, :title, :publication_year
end
