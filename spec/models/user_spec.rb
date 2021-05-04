require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  describe 'Active Record Associations' do
    it 'has_many created_events' do
      expect { should has_many(:created_events).with_foreign_key(:creator_id).class_name('Event').dependent(:destroy) }
    end
    it 'has_many invitations' do
      expect { should has_many(:invitation) }
    end
    it ' has_many attended_event' do
      expect { should has_many(:attended_event).through(:invitation) }
    end
  end
end
