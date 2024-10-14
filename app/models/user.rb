class MUser < ApplicationRecord
    self.table_name = 'm_users'
    attr_encrypted :email, key: 'a secret key'
    attr_encrypted :phone_number, key: 'another secret key'
end