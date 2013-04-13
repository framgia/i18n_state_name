require "i18n_state_name/version"

module I18nStateName
  extend ActiveSupport::Concern

  I18N_KEY_PREFIX = "activerecord.state_machines"

  included do
    init_i18n_state_names
  end

  module ClassMethods
    def i18n_state_name state_name = nil
      @i18n_state_names[state_name] || state_name
    end

    def i18n_state_names state_names = nil
      if state_names
        state_names.map{|state_name| { state_name => i18n_state_name(state_name) }}
      else
        @i18n_state_names
      end
    end

    private 
    def init_i18n_state_names
      defaults = I18n.t("#{I18N_KEY_PREFIX}.defaults")
      originals = I18n.t("#{I18N_KEY_PREFIX}.#{name.underscore.gsub('/', '_')}")
      @i18n_state_names = [defaults, originals].inject({}) do |state_names, i18ns|
        i18ns.class == Hash ? state_names.merge!(i18ns) : state_names
      end
    end
  end

  def i18n_state_name
    self.class.i18n_state_name state_name
  end

end
