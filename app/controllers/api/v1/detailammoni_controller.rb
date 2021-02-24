module Api
    module V1
        class DetailammoniController<ApplicationController
            def index
                detail=Detailammoni.joins(:ammoni).select("detailammonis.*,ammonis.location").where(updated_at: Detailammoni.select('Max(detailammonis.updated_at)')).group("ammonis.id,detailammonis.ammoni_id,detailammonis.id")
                render json:{status: 'SUCCESS', message: 'Loaded Detail Ammonia', data:detail},status: :ok
            end
            def show
                detail=Detailammoni.find(params[:id])
                render json:{status: 'SUCCESS', message: 'Details By ID', data:detail},status: :ok
            end

            def create
                ammoni=Ammoni.find(params[:ammoni_id])
                detail=Detailammoni.new(detail_param)
                detail.ammoni_id=ammoni.id
                if detail.save
                    render json:{status: 'SUCCESS', message: 'Save Data detail Ammonia', data:detail},status: :ok
                else
                    render json:{status: 'FAIL', message: 'Failed detail Ammonia', data:detail.errors},status: :unprocessable_entity
                end

            end

            def update
                detail=Detailammoni.find(params[:id])
                if detail.update(:ID_Device=>params[:ID_Device])
                    render json:{status:'SUCCESS', message:'update sucessful', data:detail}, status: :ok
                else
                    render json:{status:'FAIL', message:'failed', data:counter.errors}, status: :ok
                end
            end

            def destroy
                detail=Detailammoni.find(params[:id])
                if detail.destroy
                    render json:{status:'SUCCESS', message:'Delete sucessful', data:detail}, status: :ok
                else
                    render json:{status:'FAIL', message:'failed', data:counter.detail}, status: :ok
                end
            end


            private
            def detail_param
                params.require(:detailammoni).permit(:ID_Device, :level)
            end

        end
    end
end
