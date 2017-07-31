var Category = React.createClass({
    propTypes:{
    name: React.PropTypes.string,
    uri: React.PropTypes.string,
    slug: React.PropTypes.string
  },
  getInitialState: function() {
  return { services: [] };
  },

  getServices: function(e){
    var self = this
    var div = e.target.nextElementSibling
    if(self.state.services.length===0){
      $.ajax({
        url: `/api/service?query=${self.props.slug}`,
        success: function(data) {
          self.setState({ services: data });
          $(div).css('visibility', 'visible');
          $(div).addClass('active');
        },
        error: function(xhr, status, error) {
          alert('Cannot get data from API: ', error);
        }
      });
    }else{
      $(div).removeClass('active');
      setTimeout(function(){
        $(div).css('visibility', 'hidden');
        self.setState({services: []})
      }, 400);
    }
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
              <h3 onClick={this.getServices} >
                {category.name}
              </h3>
              <ul className="list-group services">
                  {collection}
              </ul>
      </li>
    )
  }
})