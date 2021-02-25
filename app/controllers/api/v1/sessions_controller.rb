module Api 
    module V1
        class SessionsController<ApplicationController

            # ongoing .......
            def index
            user=User.order('id DESC')
            render json:{status: 'SUCCESS', message: 'Loaded Detail  Info User', data:user},status: :ok
            end

            def create
                user=User.create(user_params)
            end
            
        end
    end
end