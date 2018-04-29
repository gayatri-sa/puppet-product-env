require 'spec_helper'
describe 'myphp' do
  context 'with default values for all parameters' do
    it { should contain_class('myphp') }
  end
end
