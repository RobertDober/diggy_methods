# frozen_string_literal: true

require_relative 'diggy_methods/kernel'
module Lab42
  class DiggyMethods
    attr_reader :data

    # In case data has key :data (often the case)
    def __data__; @data end

    private

    def initialize(**data)
      @data = data
    end

    def method_missing(name)
      found = data.fetch(name)
      if found.respond_to?(:to_h)
        self.class.new(**found)
      else
        found
      end
    end
  end
end
#  SPDX-License-Identifier: Apache-2.0
