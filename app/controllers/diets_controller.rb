class DietsController < ApplicationController

    def index
        @diets = Diet.order(:refeicao)
        @infos = Info.order(:data_inicio)
    end

    def new
        @diets = Diet.order(:refeicao)
    end

    def create
        diet = params.require(:diet).permit(:horario, :refeicao, :descricao)
        Diet.create diet

        redirect_to new_diet_path
    end

    def destroy
        id = params[:id]
        Diet.destroy id
        redirect_to diets_path
    end

    def search
        diet = params[:refeicao]
        @diets = Diet.where "refeicao like ?", "%#{refeicao}%"
    end
end
