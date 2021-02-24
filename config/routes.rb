Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources:counter
      resources:detailcounter
      resources:ammoni
      resources:detailammoni
      resources:infocounter
      resources:infoammonia
      resources:sessions
      resources:display
      resources:resultcountermonth, only:[:index]
      resources:displaygraph, only:[:index]
      resources:totaldevice, only:[:index]
    end
  end   
end
