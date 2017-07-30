var Industry = React.createClass({
  propTypes:{
    name: React.PropTypes.string,
    uri: React.PropTypes.string,
    slug: React.PropTypes.string
  },
  getInitialState: function() {
  return { categories: [] };
  },
  getCategories: function(){
    var self = this
    $.ajax({
      url: `/api/category?query=${self.props.slug}`,
      success: function(data) {
        self.setState({ categories: data });
      },
      error: function(xhr, status, error) {
        alert('Cannot get data from API: ', error);
      }
    });
  },
  render: function(){
    var industry = this.props
    var collection = []
    this.state.categories.forEach(function(category){
      collection.push(<Category name={category.name}
                                uri={category.uri}
                                slug={category.slug}
                                key={'category' + category.id}/>)
      }.bind(this));
    return(
      <li className="list-group-item-heading">
              <h4 onClick={this.getCategories}>
                {industry.name}
                 <ul className="list-group">
                  {collection}
                </ul> 
              </h4>
      </li>
    )
  }
})