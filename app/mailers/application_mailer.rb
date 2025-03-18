# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base # rubocop:disable Style/Documentation
  default from: 'communications@ghii.org'
  layout 'mailer'
end
