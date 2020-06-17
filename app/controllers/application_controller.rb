class ApplicationController < ActionController::Base
    
    # Verficando se a sessão está ativa, senão o usuário é redirecionado para o login
    before_action :authenticate_user!

end
