class InfosController < ApplicationController

    def index
        @diets = Diet.order(:refeicao)
        @infos = Info.order(:data_inicio)
        @weights = Weight.order(:peso_atual)
    end

    def new
        @infos = Info.new
        @diets = Diet.new
        @weights = Weight.new
    end

    def create
        values = params.require(:info).permit(:data_inicio, :data_fim, :peso, :peso_ideal, :altura)
        
        @info = Info.new values
        @info.user_id = current_user.id

        if @info.save
            redirect_to new_diet_path
        else
            render :new
        end
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
