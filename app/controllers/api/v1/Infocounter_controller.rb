module Api
    module V1
        class InfocounterController<ApplicationController
            # display setup/information counter eg 30 max
            def index 
                info=Infocounter.order('id DESC')
                render json:{status: 'SUCCESS', message: 'Loaded Detail  Info Counter', data:info},status: :ok
            end
            # display information counter by ID

            def show
                info=Infocounter.find(params[:id])
                render json:{status: 'SUCCESS', message: 'Details By Info Counter', data:info},status: :ok
            end
            # create infomation counter

            def create 
                info=Infocounter.new(detail_param)
                if info.save
                    render json:{status: 'SUCCESS', message: 'Details By Info Counter', data:info},status: :ok
                else
                    render json:{status:'FAIL', message:'failed', data:info.errors}, status: :ok
                end
            end
            # update information counter

            def update
                info=Infocounter.find(params[:id])
                if info.update(:level_count=>params[level_count],:details=>params[details])
                    render json:{status: 'SUCCESS', message: 'Update By ID', data:info},status: :ok
                else
                    render json:{status:'FAIL', message:'failed', data:info.errors}, status: :ok
                end
            end
            # delete information counter
            def destroy
                info=Infocounter.find(params[:id])
                if info.destroy
                    render json:{status: 'SUCCESS', message: 'Success Delete', data:info},status: :ok
                else
                    render json:{status:'FAIL', message:'failed', data:info.errors}, status: :ok
                end
            end


            private
            def detail_param
                params.permit(:levelcount, :detail)
            end
        end
    end
end