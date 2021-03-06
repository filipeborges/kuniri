#
# Copyright (C) 2015-2017 Rodrigo Siqueira  <siqueira@kuniri.org>
#
# This source code is licensed under the GNU lesser general public license,
# Version 3.  See the file COPYING for more details

require_relative '../../../util/logger_kuniri'

module Languages

  # Mixin to automatically add behaviour inside attribute and variables.
  module VariableBehaviourHelpers

    MODULEBASE = 'Languages::'
    VARIABLECLASS = '::VariableBehaviour'

    # Setup basic configurations for make attribute work correctly. It is
    # mandatory to call it with the correct parameters in the child class.
    # @param pVariableBehaviour Reference to a variable behaviour.
    def setup_variable_behaviour
      expression = MODULEBASE + type_of_language + VARIABLECLASS +
                   type_of_language
      begin
        clazz = Object.const_get(expression)
        @variableBehaviour = clazz.new(who_am_i)
      rescue NameError
        Util::LoggerKuniri.error('Class name error')
      end
    end

    # Usually this module can be inserted in some abstract class, hence it is
    # useful to have a method that return the current class name
    # @return String with a class name.
    def who_am_i
      self.class.superclass.name.split('::').last
    end

    # @note We expect a specific module related with specific class
    def type_of_language
      self.class.name.split('::')[1]
    end
  # Module
  end
# Module
end
