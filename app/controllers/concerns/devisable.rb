module Devisable
    extend ActiveSupport::Concern

    included do
      before_action :authenticate_user!
    end

    private

    # def after_sign_in_path_for(resource)
    #   root_path
    # end

    def after_sign_out_path_for(resource)
      root_path
    end

    def resource_class
      User
    end

    def resource_name
      :user
    end
end
