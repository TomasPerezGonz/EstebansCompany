class User < ApplicationRecord
    has_many :job_offers
    has_many :applications

end
