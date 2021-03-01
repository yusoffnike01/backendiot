module Api
    module V1
        class DetailcounterController<ApplicationController
            # display data counter according id device by max date 
            def index
                detail=Detailcounter.find_by_sql("select detailcounters.*,
                counters.location, detailcounters.count from ((detailcounters inner join(select detailcounters.counter_id,max(detailcounters.updated_at)
                as MaxDate from detailcounters group by detailcounters.counter_id)tm on detailcounters.counter_id =tm.counter_id and detailcounters.updated_at
                =tm.MaxDate)inner join counters on detailcounters.counter_id =counters.id)group by date(detailcounters.updated_at),detailcounters.id,counters .location")
                
                render json:{status: 'SUCCESS', message: 'Loaded Detail Counter', data:detail},status: :ok
            end
            # display data counter by ID
            def show
                detail=Detailcounter.find_by_sql("select detailcounters.count, Date(detailcounters.updated_at), counters.location from detailcounters inner join counters on detailcounters.counter_id=counters.id where  detailcounters.updated_at IN (SELECT max (detailcounters.updated_at) from detailcounters where detailcounters.counter_id='#{params[:id]}')")
        
                render json:{status: 'SUCCESS', message: 'Details By ID', data:detail},status: :ok
            end
            # create data counter

            def create
                counter=Counter.find(params[:counter_id])
                detail=Detailcounter.new(detail_param)
                detail.counter_id=counter.id
                if detail.save
                    render json:{status: 'SUCCESS', message: 'Save Data detail Count', data:detail},status: :ok
                else
                    render json:{status: 'FAIL', message: 'Failed detail Count', data:detail.errors},status: :unprocessable_entity
                end

            end
            # update data counter if necessary 
            def update
                detail=Detailcounter.find(params[:id])
                if detail.update(:count=>params[:count])
                    render json:{status:'SUCCESS', message:'update sucessful', data:detail}, status: :ok
                else
                    render json:{status:'FAIL', message:'failed', data:counter.errors}, status: :ok
                end
            end
            # delete data counter if necessary

            def destroy
                detail=Detailcounter.find(params[:id])
                if detail.destroy
                    render json:{status:'SUCCESS', message:'Delete sucessful', data:detail}, status: :ok
                else
                    render json:{status:'FAIL', message:'failed', data:counter.detail}, status: :ok
                end
            end


            private
            def detail_param
                params.require(:detailcounter).permit(:ID_Device, :count)
            end

        end
    end
end
