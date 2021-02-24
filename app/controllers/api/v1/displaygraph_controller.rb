module Api
    module V1
        class DisplaygraphController<ApplicationController
            # display data ammoni by graph 
            def index 
                detail=Detailammoni.find_by_sql('select detailammonis.* , ammonis.location from((detailammonis inner join (select detailammonis.ammoni_id, max(detailammonis.updated_at )as MaxDate from detailammonis group by detailammonis.ammoni_id)tm on detailammonis.ammoni_id=tm.ammoni_id and detailammonis.updated_at=tm.MaxDate)inner join ammonis on detailammonis.ammoni_id=ammonis.id)')
                render json:{status: 'SUCCESS', message: 'Loaded Detail Counter', data:detail},status: :ok
            end
        end        
    end
end
        