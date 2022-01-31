# frozen_string_literal: true

require_relative 'diggy_methods/kernel'
module Lab42
  class DiggyMethods
    attr_reader :data

    # In case data has key :data (often the case)
    def __data__; @data end

    private

    def initialize(a=nil, **data_)
      @data = _make_data_from_args(a, data_)
    end

    def _make_data_from_args(a, data_)
      case a
      when Hash
        a.merge(data_)
      when nil
        data_
      else
        _try_convert(a, data_)
      end
    end

    def _try_convert(a, data_)
      if a.respond_to?(:to_h)
        a.to_h.merge(data_)
      else
        raise TypeError
      end
    rescue TypeError
      raise ArgumentError, "positional argument must be a hash or respond to to_h if present"
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
