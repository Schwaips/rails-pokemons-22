class Trainer < ApplicationRecord
  has_many :pokeballs, dependent: :destroy
  has_many :pokemons, through: :pokeballs

  has_one_attached :avatar # => Trainer.toto.attached?
end
