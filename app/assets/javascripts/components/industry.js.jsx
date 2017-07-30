var Industry = React.createClass({
  propTypes:{
    name: React.PropTypes.string,
    uri: React.PropTypes.string,
    slug: React.PropTypes.string
  },
  getInitialState: function() {
  return { categories: [] };
  },
  
  resetState: function(){
    this.setState( { categories: [] })
  },

  getCategories: function(e){
    var self = this
    var div = e.target.nextElementSibling
    if(self.state.categories.length === 0){
      $.ajax({
        url: `/api/category?query=${self.props.slug}`,
        success: function(data) {
          self.setState({ categories: data });
          $(div).css('visibility', 'visible');
          $(div).addClass('active');
        },
        error: function(xhr, status, error) {
          alert('Cannot get data from API: ', error);
        }
      });
    }else{
      $('.categories').removeClass('active');
      setTimeout(function(){
        $('.categories').css('visibility', 'hidden');
        self.setState({categories: []})
      }, 400);
    }
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
      <li className="list-group-item-heading industries">
              <h2 onClick={this.getCategories}>
                {industry.name}
              </h2>
               <ul className="list-group categories">
                  {collection}
              </ul> 
      </li>
    )
  }
})