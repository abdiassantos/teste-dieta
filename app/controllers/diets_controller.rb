class DietsController < ApplicationController

    before_action :set_diet, only: [:edit, :update, :destroy]

    def index
        @diets = Diet.order(:horario).where("user_id = ?", current_user.id)
        @infos = Info.order(:data_inicio).where("user_id = ?", current_user.id)
    end

    def new
        @diet = Diet.new
        @info = Info.new
        @diets = Diet.order(:horario).where("user_id = ?", current_user.id)
    end

    def edit
        @diets = Diet.order(:horario).where("user_id = ?", current_user.id)

        render :edit
    end

    def update
        if @diet.update diet_params
            redirect_to diets_path
        else
            :edit
        end
    end

    def create
        @diet = Diet.new diet_params
        @diet.user_id = current_user.id

        if @diet.save 
            redirect_to new_diet_path
        else
            render :new
        end
    end

    def destroy
        @diet.destroy
        redirect_to diets_path
    end

    def search
        diet = params[:refeicao]
        @diets = Diet.where "refeicao like ?", "%#{refeicao}%"
    end

    # Funções pprivadas do controller
    private

    def diet_params
        params.require(:diet).permit(:horario, :refeicao, :descricao)
    end

    def set_diet
        @diet = Diet.find(params[:id])
    end
end
