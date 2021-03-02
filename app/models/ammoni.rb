class Ammoni < ApplicationRecord
    has_many:detailammoni, :dependent => :delete_all
end
