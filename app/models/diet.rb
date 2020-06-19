class Diet < ApplicationRecord

    belongs_to :user

    validates :horario, presence: true
    validates :refeicao, presence: true
    validates :descricao, presence: true

end
