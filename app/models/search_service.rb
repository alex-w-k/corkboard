class SearchService
  def initialize
     @conn = Faraday.new(:url => "https://corkboard-micro.herokuapp.com/api/v1")
  end

  def get(query= '')
    @conn.get 'records', {query: query}
  end

  def post(post_params)
    @conn.post 'records', post_params
  end

  def put(id, put_params)
    @conn.put "records/#{id}", put_params
  end
  
  def put(id)
    @conn.delete "records#{id}"
  end
end