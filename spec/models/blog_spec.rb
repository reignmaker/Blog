require 'spec_helper'

describe Blog do

  it { should validate_presence_of :name}
  it { should have_many :posts }

end
