# server.rb
require 'sinatra'
require 'mongoid'

# load mongaoid DB SETUP:
Mongoid.load! "mongoid.config"


# book model:
class Book
  include Mongoid::Document
  field :title, type: String
  field :author, type: String
  field :isbn, type: String
  
  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true
  
  index({ title: 'text' })
  index({ isbn:1 }, { unique: true, name: "isbn_index" })
  
end


  # end points
  get '/' do
    'Welcome to BookList!'
  end
