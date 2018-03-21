require 'spec_helper'
describe 'sampleclass' do
  context 'with default values for all parameters' do
    it { should contain_class('sampleclass') }
  end
end
