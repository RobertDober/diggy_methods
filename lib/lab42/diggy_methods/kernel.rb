# frozen_string_literal: true

module Kernel
  def Diggy(a=nil, **k)
    data =
      case a
      when Hash
        a.merge(k)
      when nil
        k
      else
        if a.respond_to?(:to_h)
          a.to_h.merge(k)
        else
          raise TypeError
        end
      end
    Lab42::DiggyMethods.new(**data)
  rescue TypeError
          raise ArgumentError, "positional argument must be a hash or respond to to_h if present"
  end
end
#  SPDX-License-Identifier: Apache-2.0
