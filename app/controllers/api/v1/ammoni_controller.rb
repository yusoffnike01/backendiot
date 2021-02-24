module Api::V1
    class AmmoniController<ApplicationController
        # display data ammonia 
        def index
            ammonia= Ammoni.order('id DESC');
            
            render json:{status: 'SUCCESS', message: 'Loaded User', data:ammonia},status: :ok
        end
        # display data ammonia by ID
        def show 
            ammonia=Ammoni.find(params[:id])
            render json:{status: 'SUCCESS', message: 'Loaded Data Ammonia', data:ammonia},status: :ok
        end
        # create data ammonia 
        def create 
            ammonia=Ammoni.new(ammonia_params)
            if ammonia.save
                render json:{status:'SUCCESS', message:'Save Data', data:ammonia},status: :ok
            else
                render json:{status:'Fail', message:'Save Data', data:ammonia.errors},status: :unprocessable_entity
            end
        end
        # update data ammonia if necessary

        def update
            ammonia=Ammoni.find(params[:id])
            if ammonia.update(:location=>params[:location])
                render json:{status:'SUCCESS', message:'Update Data', data:ammonia},status: :ok
            else
                render json:{status:'Fail', message:'Fail Data', data:ammonia.errors},status: :unprocessable_entity
            end
        end
        # delete data ammonia 

        def destroy
            ammonia=Ammoni.find(params[:id])
            if ammonia.destroy
                render json:{status:'SUCCESS', message:'Delete Data', data:ammonia},status: :ok
            else
                render json:{status:'Fail', message:'Fail Data', data:ammonia.errors},status: :unprocessable_entity
            end
        end  


        private
        def ammonia_params
            params.permit(:role_id, :ID_Device,:location)
        end
    end  
end