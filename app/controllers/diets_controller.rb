class DietsController < ApplicationController

    def index
        @diets = Diet.order(:horario).where("user_id = ?", current_user.id)
        @infos = Info.order(:data_inicio).where("user_id = ?", current_user.id)
    end

    def new
        @diet = Diet.new
        @info = Info.new
        @diets = Diet.order(:horario).where("user_id = ?", current_user.id)
    end

    def create
        values = params.require(:diet).permit(:horario, :refeicao, :descricao)

        @diet = Diet.new values
        @diet.user_id = current_user.id

        if @diet.save 
            redirect_to new_diet_path
        else
            render :new
        end
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
