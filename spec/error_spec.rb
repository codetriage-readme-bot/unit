# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Errors" do
  describe "TypeError when adding incompatible units" do
    it "should have a nice error message" do
      a = Unit(1, "meter")
      b = Unit(1, "second")
      expect { a + b }.to raise_error(TypeError, "#{a.inspect} and #{b.inspect} are incompatible")
    end
  end

  describe "TypeError when trying to convert incompatible unit using #in!" do
    it "should have a nice error message" do
      unit = Unit(1000, "m / s")
      expect { unit.in!("seconds") }.to(
        raise_error(TypeError, %{Unexpected #{unit.inspect}, expected to be in s})
      )
    end

    it "should have a nice error message using the DSL", dsl: true do
      unit = Unit(1000, "m / s")
      expect { unit.in_seconds! }.to(
        raise_error(TypeError, %{Unexpected #{unit.inspect}, expected to be in s})
      )
    end
  end

end
