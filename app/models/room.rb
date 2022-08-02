class Room < ApplicationRecord
  validates_presence_of :title, :location
  validates_length_of :description, minimum: 10, allow_blank: false, :message => "nao pode ficar em branco "

  def complete_name
    "#{title}, #{location}"
  end
end
