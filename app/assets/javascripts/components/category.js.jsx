var Category = React.createClass({
    propTypes:{
    name: React.PropTypes.string,
    uri: React.PropTypes.string,
    slug: React.PropTypes.string
  },
  getInitialState: function() {
  return { services: [] };
  },

  getServices: function(){
    var self = this
    $.ajax({
      url: `/api/service?query=${self.props.slug}`,
      success: function(data) {
        self.setState({ services: data });
      },
      error: function(xhr, status, error) {
        alert('Cannot get data from API: ', error);
      }
    });
  },
  render: function(){
      var category = this.props
      var collection = []
      this.state.services.forEach(function(service){
       collection.push(<Service name={service.name}
                                uri={service.uri}
                                slug={service.slug}
                                key={'service' + service.id}/>)
      }.bind(this));
    return(
      <li className="list-group-item-heading">
              <h4 onClick={this.getServices}>
                {category.name}
                <ul className="list-group">
                  {collection}
                </ul>
              </h4>
      </li>
    )
  }
})