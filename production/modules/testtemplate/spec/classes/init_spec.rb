require 'spec_helper'
describe 'testtemplate' do
  context 'with default values for all parameters' do
    it { should contain_class('testtemplate') }
  end
end
