module CommonName
  class Railtie < ::Rails::Railtie
    initializer 'ActiveRecord' do
      ::ActiveRecord::Base.class_eval do
        def self._common_name
          name.underscore
        end
        include ::CommonName
      end
    end

    initializer 'ActionController' do
      ::ActionController::Base.class_eval do
        def self._common_name
          controller_name.singularize
        end
        include ::CommonName
      end
    end
  end
end
