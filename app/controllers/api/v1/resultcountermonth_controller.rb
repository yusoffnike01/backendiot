module Api
    module V1
        #  display data device counter
        class ResultcountermonthController<ApplicationController
            def index
                detail=Detailcounter.find_by_sql(" SELECT detailcounters.id,detailcounters.counter_id,detailcounters.updated_at,counters.location,detailcounters.count from ((detailcounters 
                inner join (select detailcounters.counter_id, max(detailcounters.updated_at)as MaxDate from detailcounters group by detailcounters.counter_id)tm on detailcounters.counter_id=tm.counter_id and detailcounters.updated_at=tm.MaxDate)inner join counters on detailcounters.counter_id=counters.id) GROUP BY DATE (detailcounters.updated_at),detailcounters.id,counters.location")
                 render json:{status: 'SUCCESS', message: 'Loaded Detail Counter', data:detail},status: :ok
            end
        end
    end
end       