require 'rails_helper'
require 'spec_helper'

RSpec.describe Event, type: :model do
  describe 'Active Record Associations' do
    it 'belongs_to creator' do
      expect { should belongs_to(:creator).class_name('User') }
    end
    it 'has_many invitations' do
      expect { should has_many(:invitation).dependent(:destroy) }
    end
    it 'has many attendees' do
      expect { should has_many(:attendees).through(:invitation) }
    end
  end
end
