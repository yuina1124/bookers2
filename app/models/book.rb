class Book < ApplicationRecord

  belongs_to :user


  validates :title, presence: true
  validates :body, presence: true, uniqueness: true, length: {maxmum: 200 }

end
