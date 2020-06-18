class Diet < ApplicationRecord

    validates :horario, presence: true
    validates :refeicao, presence: true
    validates :descricao, presence: true

end
