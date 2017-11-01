module Consulate
  # Catalog HTTP Api for Consul.io
  class Catalog
    RESOURCE = 'catalog'.freeze

    attr_reader :base_url

    def initialize
      @base_url = format('%s/%s', Consulate.endpoint, RESOURCE)
    end

    def services
      # Lists out services
      url = format('%s/%s', base_url, 'services'.freeze)

      JSON.parse(Consulate.http.get(url)['body'])
    end
  end
end
