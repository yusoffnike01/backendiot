class Counter < ApplicationRecord
has_many:detailcounter, :dependent => :delete_all

end
