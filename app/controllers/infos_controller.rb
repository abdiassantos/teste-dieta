class InfosController < ApplicationController

    def index
        @diets = Diet.order(:refeicao)
        @infos = Info.order(:data_inicio)
    end

    def create
        info = params.require(:info).permit(:data_inicio, :data_fim, :peso, :peso_ideal, :altura)
        Info.create info
    end

    def destroy
        id = params[:id]
        Info.destroy id
        redirect_to diets_path
    end

    def search
        info = params[:data_inicio]
        @infos = Info.where "data_inicio like ?", "%#{data_inicio}%"
    end

end
