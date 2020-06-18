class WeightsController < ApplicationController

    def index
        @weights = Weight.order(:peso_atual)
    end

    def new
        @weights = Weight.order(:peso_atual)
    end

    def create
        weight = params.require(:weight).permit(:peso_atual)
        Weight.create weight

        redirect_to root_url
    end

end
