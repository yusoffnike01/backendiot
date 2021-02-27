module Api
    module V1
        class GetallcountController<ApplicationController
            def index
                detail=Detailcounter.find_by_sql('select detailcounters.count ,Date(detailcounters.updated_at) from detailcounters  where detailcounters.updated_at in (select max(detailcounters.updated_at) from detailcounters )')
                render json:{status: 'SUCCESS', message: 'Loaded Get all count', data:detail},status: :ok
            end
        end
    end
end