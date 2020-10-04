module Helpers
  module Request
    def body
      JSON.parse response.body, symbolize_names: true
    end
  end
end
