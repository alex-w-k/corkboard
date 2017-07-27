
var HomePage = React.createClass({

  getInitialState: function() {
return { results: [] };
},

handleSearch: function(results) {
    this.setState({ results: results });
  },
  render: function() {
    return(
      <div>
        <div className="jumbotron">
            <div className="container text-center">
                <div className="row">
                    <div className="col-md-6 col-md-offset-3">
                        <h1>Consider it done.</h1>
                    </div>
                    <div className="col-md-6 col-md-offset-3">
                        <h3>From house painting to personal training, we bring you the right pros for every project on your list.</h3>
                    </div>
                     <SearchForm handleSearch={this.handleSearch} /> 
                </div>
            </div>
        </div> 
        <HomeIcons/>
        <SearchResults results={this.state.results} />
    </div>
    )
  }
});