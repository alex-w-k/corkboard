var SearchForm = React.createClass({
    handleSearch: function() {
    var query = document.getElementById('query').value
    var self = this;
    $.ajax({
      url: 'https://cork-api.alexwk.rocks/api/v1/records/',
      data: { query: query },
      success: function(data) {
        self.props.handleSearch(data);
      },
      error: function(xhr, status, error) {
        alert('Search error: ', status, xhr, error);
      }
    });
  },
  render: function() {
    return(
            <div className="col-md-6 col-md-offset-3 form-group">
              <input onChange={this.handleSearch}
                    type="text"
                    className="form-control"
                    placeholder="What service do you need?"
                    id='query' />
            </div>
          )
  }
});
