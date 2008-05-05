# CanHasLoad
module CanHasLoad
  module CanHasActiveRecord
    def find_by_default_param(id)
      method = self.column_names.include?("slug") ? :find_by_slug : :find_by_id
      send method, id
    end
  end
  
  module CanHasActionController
    private
      def loads(thing, options = {})
        by = options.delete(:by) || :id
        within = options.delete(:within) || nil
        sets = options.delete(:sets) || nil
        optional = options.delete(:optional) || nil
        before_filter(options) { |controller|
          if within
            getter = controller.params[within][by]
          else
            getter = controller.params[by]
          end
          record = thing.to_s.camelize.constantize.find_by_default_param(getter)
          raise ActiveRecord::RecordNotFound.new("Unable to find #{thing} #{getter}") unless record or optional
          controller.instance_variable_set "@#{thing}", record
          if sets
            controller.instance_variable_set "@#{sets}", record.send(sets)
          end
        }
      end
  end
end