# This library comes out of my frustration with seeing lines like
# 
#   BusCompany.name.underscore.humanize.downcase.pluralize #=> "bus companies"
# 
# all over my application.
# 
# See <tt>README</tt> for more information.
# 
# Copyright (c) 2009 Seamus Abshere. See LICENSE for details.

require 'active_support'

if defined?(Rails)
  require 'common_name/railtie'
end

module CommonName
  def self.included(klass)
    klass.extend ClassMethods
  end
  
  METHODS = %w{
    name   symbol        instance        title        human        camel
    plural plural_symbol plural_instance plural_title plural_human plural_camel
    model
  }
  
  # delegate instance methods to class methods
  METHODS.each do |m|
    eval %{ def common_#{m}; self.class.common_#{m}; end }
  end
  
  module ClassMethods
    # "bus_company"
    #
    # Identical to <tt>_common_name</tt>, which you have to provide.
    def common_name;              _COMMON_NAME            ||= _common_name;                                                             end

    # :bus_company
    def common_symbol;            _COMMON_SYMBOL          ||= common_name.to_sym;                                                       end
    
    # "@bus_company"
    #
    # For use with <tt>instance_variable_get</tt>, etc.
    def common_instance;          _COMMON_INSTANCE        ||= '@' << common_name;                                                       end
    
    # "Bus company"
    #
    # Microsoft titlecase.
    def common_title;             _COMMON_TITLE           ||= common_name.humanize;                                                     end
    
    # "bus company"
    #
    # Unlike <tt>humanize</tt>, this is lowercase.
    def common_human;             _COMMON_HUMAN           ||= common_title.downcase;                                                    end
    
    # "BusCompany"
    def common_camel;             _COMMON_CAMEL           ||= common_name.camelcase;                                                    end
    
    # BusCompany
    #
    # Already constantized.
    def common_model;             _COMMON_MODEL           ||= common_camel.constantize;                                                 end

    # "bus_companies"
    #
    # Derived from _common_name, unless you provide _common_plural.
    def common_plural;            _COMMON_PLURAL          ||= (respond_to?(:_common_plural) ? _common_plural : common_name.pluralize);  end
    
    # :bus_companies
    def common_plural_symbol;     _COMMON_PLURAL_SYMBOL   ||= common_plural.to_sym;                                                     end
    
    # "@bus_companies"
    def common_plural_instance;   _COMMON_PLURAL_INSTANCE ||= '@' << common_plural;                                                     end
    
    # "Bus companies"
    #
    # See +common_title+ for notes on capitalization.
    def common_plural_title;      _COMMON_PLURAL_TITLE    ||= common_plural.humanize;                                                   end
    
    # "bus companies"
    #
    # See +common_human+ for notes on capitalization.
    def common_plural_human;      _COMMON_PLURAL_HUMAN    ||= common_plural_title.downcase;                                             end
    
    # "BusCompanies"
    def common_plural_camel;      _COMMON_PLURAL_CAMEL    ||= common_plural.camelcase;                                                  end
  end
end
