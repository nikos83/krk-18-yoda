class Document < ApplicationRecord
    belongs_to :bucket
   # belongs_to :user, through: :bucket
end
