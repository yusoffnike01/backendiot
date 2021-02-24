module Api
    module V1
        class InfoammoniaController<ApplicationController
            # display data information ammonia 
            def index 
                info=Infoammoni.order('id DESC')
                render json:{status: 'SUCCESS', message: 'Loaded Detail  Info Ammonia', data:info},status: :ok
            end
            # display data information by ID

            def show
                info=Infoammoni.find(params[:id])
                render json:{status: 'SUCCESS', message: 'Details By Info Ammonia', data:info},status: :ok
            end
            # create data information ammonia 

            def create 
                info=Infoammoni.new(detail_param)
                if info.save
                    render json:{status: 'SUCCESS', message: 'Details By Info AMmonia', data:info},status: :ok
                else
                    render json:{status:'FAIL', message:'failed', data:info.errors}, status: :ok
                end
            end
            # update data information ammonia 

            def update
                info=Infoammoni.find(params[:id])
                if info.update(:level_count=>params[level_count],:details=>params[details])
                    render json:{status: 'SUCCESS', message: 'Update By ID', data:info},status: :ok
                else
                    render json:{status:'FAIL', message:'failed', data:info.errors}, status: :ok
                end
            end
            # delete information ammonia 

            def destroy
                info=Infoammoni.find(params[:id])
                if info.destroy
                    render json:{status: 'SUCCESS', message: 'Success Delete', data:info},status: :ok
                else
                    render json:{status:'FAIL', message:'failed', data:info.errors}, status: :ok
                end
            end


            private
            def detail_param
                params.permit(:levelammonia, :detail)
            end
        end
    end
end