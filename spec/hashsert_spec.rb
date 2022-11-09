require "jekyll"
require "minitest/autorun"

require_relative "../lib/jekyll-hashsert"
include Jekyll::Hashsert

class InputValidatorTests
  describe "tests for input validation checker function" do

    it "should reject empty string inputs" do
      assert_equal false, is_valid({ input: "", testCase: true })
    end

    it "should reject nil string inputs" do
      assert_equal false, is_valid({ input: nil, testCase: true })
    end

    it "should reject non string inputs" do
      assert_equal false, is_valid({ input: 69, testCase: true })
    end

    it "should accept non empty string inputs" do
      assert_equal true, is_valid({ input: "abc", testCase: true })
    end

    it "should reject non string symbols" do
      assert_equal false, is_valid({ input: "abc", symbol: 1, testCase: true })
    end

    it "should reject alphnumeric symbols" do
      assert_equal false, is_valid({ input: "abc", symbol: "a", testCase: true })
    end

    it "should reject multi-character symbols" do
      assert_equal false, is_valid({ input: "abc", symbol: "$_", testCase: true })
    end

    it "should only accept one character long special symbol" do
      assert_equal true, is_valid({ input: "abc", symbol: "_", testCase: true })
    end

    it "should reject non Integer sizes" do
      assert_equal false, is_valid({ input: "abc", size: "69", testCase: true })
    end

    it "should accept Integer sizes" do
      assert_equal true, is_valid({ input: "abc", size: 69, testCase: true })
    end

  end
end

class HashGenerationTests
  describe "tests for hash generation function" do

    # since hash will be random for each run, we only assert for the size of generated string
    # and characters in it, not the generated values.

    it "should generate a string of size 64 by default" do
      assert_equal 64, hashsert("$").size
    end

    it "should only generate a string with alphanumeric characters" do
      assert_equal true, hashsert("$").index(/[^[:alnum:]]/).nil?
    end

    it "should generate a string of size 48 for input size 48" do
      assert_equal 48, hashsert("_", symbol = "_", size = 48).size
    end

    it "should generate a string of size 52 by replacing symbol _ in o_o" do
      assert_equal 52, hashsert("o_o", symbol = "_", size = 50).size
    end

    it "should generate a string only if input has the symbol else return the input itself" do
      assert_equal 1, hashsert("$", symbol = "_").size
    end

    # speed test to validate generated string sizes are consistent across runs
    for _ in (1..100)
      it "should generate a string of size 5" do
        assert_equal 5, hashsert("$", symbol = "$", size = 5).size
      end
    end

  end
end
