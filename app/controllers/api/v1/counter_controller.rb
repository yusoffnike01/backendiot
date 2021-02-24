module Api
    module V1
        class CounterController<ApplicationController
            # display data counter
            def index
                counter=Counter.order('id DESC')
                render json:{status: 'SUCCESS', message: 'Loaded Counter', data:counter},status: :ok
            end
            # display data counter by ID

            def show 
                counter=Counter.find(params[:id])
                render json:{status: 'SUCCESS', message: 'Loaded Counter by ID', data:counter},status: :ok
            end
            # create counter data 

            def create
                counter=Counter.new(counter_param)
                if counter.save
                    render json:{status:'SUCCESS', message:'Save data counter', data:counter}, status: :ok
                else 
                    render json:{status:'FAIL', message:'Fail save data', data:counter.errors}, status: :ok
                end
            end
            # update counter data 
            def update
                counter=Counter.find(params[:id])
                if counter.update(:location=>params[:location])
                    render json:{status:'SUCCESS', message:'update sucessful', data:counter}, status: :ok
                else
                    render json:{status:'FAIL', message:'failed', data:counter.errors}, status: :ok
                end
            end
            # delele counter data 
            def destroy
                counter=Counter.find(params[:id])
                if counter.destroy
                    render json:{status:'SUCCESS', message:'Delete sucessful', data:counter}, status: :ok
                else
                    render json:{status:'FAIL', message:'failed', data:counter.errors}, status: :ok
                end
            end
            
            private
            def counter_param
                params.permit(:ID_Device, :location)
            end

        end
    end
end