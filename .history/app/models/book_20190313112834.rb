class Book < ActiveRecord::Base
    WillPaginate.per_page = 10
    has_many :books_borrow
    has_many :books_contribute
    validates :bname, presence: true, uniqueness: true
    validates :desc, presence: true
end
