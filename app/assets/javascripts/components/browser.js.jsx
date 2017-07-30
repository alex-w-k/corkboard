
var Browser = React.createClass({

getInitialState: function() {
  return { industries: [] };
  },
 
componentDidMount: function() {
    this.getDataFromApi();
  },

getDataFromApi: function() {
    var self = this;
    $.ajax({
      url: '/api/industry',
      success: function(data) {
        self.setState({ industries: data });
      },
      error: function(xhr, status, error) {
        alert('Cannot get data from API: ', error);
      }
    });
  },

  render: function() {
    var collection = []
    this.state.industries.forEach(function(industry){
      collection.push(<Industry name={industry.name}
                                uri={industry.uri}
                                slug={industry.slug}
                                key={'industry' + industry.id}/>)
    }.bind(this));
    return(
      <ul className="list-group">
          {collection}
      </ul>
    )
  }
});