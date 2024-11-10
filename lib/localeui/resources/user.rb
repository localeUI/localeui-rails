# frozen_string_literal: true

module Localeui
  class User
    def self.sign_in(email, password)
      # sign in the user and saves returned tokens
      Localeui::Http.request(
        method: :post,
        endpoint: 'auth/sign_in',
        params: { email: email, password: password }
      )
    end

    def self.sign_out
      # sign out the user and removes tokens
      Localeui::Http.request(
        method: :delete,
        endpoint: 'auth/sign_out'
      )
    end
  end
end
