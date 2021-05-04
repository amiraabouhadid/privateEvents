require 'spec_helper'
require 'rails_helper'

RSpec.describe Invitation, type: :model do
  describe 'Active Record Associations' do
    it 'belongs_to user' do
      expect { should belongs_to(:user) }
    end
    it 'belongs_to event' do
      expect { should belongs_to(:event) }
    end
  end
end
