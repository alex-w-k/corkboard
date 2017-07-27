
var SearchResults = React.createClass({
getInitialState: function() {
  return { title: '' };
  },
  render: function() {
    var results = [];
    var title = '';
    if (this.props.results && !this.props.results.length == 0){
      title = "Search Results..."
      this.props.results.forEach(function(result) {
        results.push(<Result result={result}
                          key={'result' + result.id}/>);
      }.bind(this));
    }
    return(
      <div className="container">
          <div>
          <h3 className='results-heading'>{title}</h3>
          </div>
          <div className="results">
            {results}
          </div>
      </div>
    )
  }
});