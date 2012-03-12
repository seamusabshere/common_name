require 'test_helper'

# a pretty normal class
class BusCompany
  def self._common_name
    name.underscore
  end
  include CommonName
end

# a class where you always want to chop off the _component part and singularize
class Component
  def self._common_name
    name.underscore.sub(/_component$/, '').singularize
  end
  include CommonName
end
class AutomobilesComponent < Component; end
class GovernmentComponent < Component
  def self._common_plural
    'government'
  end
end

class CommonNameTest < Test::Unit::TestCase
  should "have required API method" do
    assert BusCompany.respond_to?(:_common_name)
    assert Component.respond_to?(:_common_name)
  end
  
  should "have optional API method" do
    assert !Component.respond_to?(:_common_plural)
    assert GovernmentComponent.respond_to?(:_common_plural)
  end
  
  should "have underscored common name" do
    assert !BusCompany._common_name.include?(' ')
    assert !Component._common_name.include?(' ')
  end
  
  {
    :common_name             => "bus_company",
    :common_symbol           => :bus_company,
    :common_instance         => "@bus_company",
    :common_title            => "Bus company",
    :common_human            => "bus company",
    :common_camel            => "BusCompany",
    :common_plural           => "bus_companies",
    :common_plural_symbol    => :bus_companies,
    :common_plural_instance  => "@bus_companies",
    :common_plural_title     => "Bus companies",
    :common_plural_human     => "bus companies",
    :common_plural_camel     => "BusCompanies",
    :common_model            => BusCompany
  }.each do |method, result|
    should "have #{method} at the class level" do
      assert_equal result, BusCompany.send(method)
    end
    
    should "have #{method} at the instance level" do
      assert_equal result, BusCompany.send(method)
    end
  end
  
  should "have common name at the class level" do
    assert_equal "component",   Component.common_name
    assert_equal "automobile",  AutomobilesComponent.common_name
    assert_equal "government",  GovernmentComponent.common_name
  end
  
  should "have common name at the instance level" do
    assert_equal "component",   Component.new.common_name
    assert_equal "automobile",  AutomobilesComponent.new.common_name
    assert_equal "government",  GovernmentComponent.new.common_name
  end
  
  should "have common plural at the class level" do
    assert_equal "components",  Component.common_plural
    assert_equal "automobiles", AutomobilesComponent.common_plural
    assert_equal "government",  GovernmentComponent.common_plural # uncountable
  end
  
  should "have common plural at the instance level" do
    assert_equal "components",  Component.new.common_plural
    assert_equal "automobiles", AutomobilesComponent.new.common_plural
    assert_equal "government",  GovernmentComponent.new.common_plural # uncountable
  end
end
