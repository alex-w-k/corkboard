class SearchService
  def initialize
    @conn = Faraday.new(:url => "https://cork-api.alexwk.rocks/api/v1")
          # @conn = Faraday.new(:url => "http://localhost:3001/api/v1")
  end

  def get(query= '')
    @conn.get 'records', {query: query}
  end

  def post(post_params)
    @conn.post 'records', {token: JsonWebToken.encode(post_params)}
  end

  def put(id, put_params)
    @conn.put "record", {token: JsonWebToken.encode(post_params)}
  end
  
  def delete(post_params)
    @conn.delete "record", {token: JsonWebToken.encode(post_params)}
  end
end
