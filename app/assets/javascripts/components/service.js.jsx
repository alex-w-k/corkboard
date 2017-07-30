var Service = React.createClass({
  propTypes:{
    name: React.PropTypes.string,
    uri: React.PropTypes.string,
    slug: React.PropTypes.string
  },
  render: function(){
    var service = this.props
    debugger
    return(
      <li className="list-group-item-heading">
              <a href={service.uri}>
                <h4>
                  {service.name}
                </h4>
              </a>
      </li>
    )
  }
})