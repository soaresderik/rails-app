class Host < ApplicationRecord
  belongs_to  :ip_address,   foreign_key: 'ip_addresses_id'
end
