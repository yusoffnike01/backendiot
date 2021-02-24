module Api
    module V1
        # display sum device Ammonia sensor  on toilet 
        class TotaldeviceController<ApplicationController
            def index
            ammonia= Ammoni.select('count(ammonis.id) as Total, ammonis.location').group(:location)
            render json:{status: 'SUCCESS', message: 'Loaded Detail Counter', data:ammonia},status: :ok
            end
        end
    end 
end