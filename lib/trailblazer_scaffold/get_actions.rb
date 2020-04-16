require 'active_support/core_ext/string'
module TrailblazerScaffold
  class GetActions

    ALLOWED_ACTIONS = %w(create update destroy).freeze

    def call(model_name)
      klass = (model_name.pluralize + '_controller').classify.safe_constantize
      klass = (model_name + 'Controller').safe_constantize unless klass.is_a?(Class)
      return unless klass.is_a?(Class)

      klass.action_methods.select { |action| ALLOWED_ACTIONS.include?(action) }
    end
  end
end
