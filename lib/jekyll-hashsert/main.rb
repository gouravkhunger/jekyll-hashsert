require "jekyll"

module Jekyll
  module Hashsert

    def hashsert(input, symbol = "$", size = 64)
      return input if !is_valid({ input: input, symbol: symbol, size: size })

      while input.include?(symbol) do
        input.sub! symbol, rand(36**(size + 5)).to_s(36)[0, size]
      end

      return input
    end

    def is_valid(args = {})
      input = args[:input] ||= ""
      symbol = args[:symbol] ||= "$"
      size = args[:size] ||= 64
      testCase = args[:testCase] ||= false

      if !input.is_a?(String)
        log("Expected input type 'String'. Got '#{input.class}'.") if !testCase

        return false
      end

      if input.nil? || input == ""
        log("Empty input string.") if !testCase

        return false
      end

      if !symbol.is_a?(String)
        log("Expected symbol type 'String'. Got '#{symbol.class}'.") if !testCase

        return false
      end

      if symbol.size != 1
        log("Symbol should only be one special character long. Got '#{symbol}'") if !testCase

        return false
      end

      if symbol.index(/[^[:alnum:]]/).nil?
        log("Expected a special character for parameter symbol. Got '#{symbol}'.") if !testCase

        return false
      end

      if !size.is_a? Integer
        log("Expected an 'Integer' parameter for size parameter. Got '#{size.class}'.") if !testCase
        
        return false
      end

      return true
    end

    def log(msg)
      Jekyll.logger.error "Hashsert:", msg
    end

  end
end

Liquid::Template.register_filter(Jekyll::Hashsert)
