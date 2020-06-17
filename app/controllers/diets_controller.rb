class DietsController < ApplicationController

    def index
        @diets = Diet.order(:refeicao)
        @infos = Info.order(:data_inicio)
    end

    def create
        diet = params.require(:diet).permit(:horario, :refeicao, :descricao)
        Diet.create diet
        redirect_to root_path
    end
end
