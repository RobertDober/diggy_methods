# frozen_string_literal: true

module Kernel
  def Diggy(a=nil, **data)
    Lab42::DiggyMethods.new(a, **data)
  end
end
#  SPDX-License-Identifier: Apache-2.0
