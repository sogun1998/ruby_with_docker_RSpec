class Micropost < ApplicationRecord
    belongs_to :user
    validates :content, length: {minimum:3, maximum:120}, 
                presence: true #can't blank
end