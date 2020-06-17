class DietsController < ApplicationController
    def index
        @diets = Diet.order(:refeicao)
        @infos = Info.order(:data_inicio)
    end
end
