class Leader < ApplicationRecord
    has_one :group

    validates :email, :first_name, :last_name, :phone_number, presence: true


    def full_name
        "#{first_name} #{last_name}"
    end

    def group_name
        group ? group.name : "No Group for this Leader"
    end
end
