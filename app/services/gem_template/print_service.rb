# frozen_string_literal: true

module GemTemplate
  # This is a trivial demonstration service constructed with an object that
  # exposes a print method.
  class PrintService < ActiveService::Base
    attr_reader :object

    validates :object, presence: true, on: :initialize

    def initialize(object:) = super

    def print
      Rails.logger.info "#{GemTemplate.configuration.print_prefix}#{printable_form} is printable!"
    end

    private

    def printable_form
      case object
      when String
        object
      else
        halt(:unhandled_type)
      end
    end
  end
end
