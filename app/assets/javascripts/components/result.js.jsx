
var Result = React.createClass({
  propTypes: {
    name: React.PropTypes.string,
    slug: React.PropTypes.string,
  },
  render: function() {
    var result = this.props.result;
    return(
      <a href='#' className='result'>
        <div>
        <h4>{result.name}</h4>
        </div>
      </a>
    )
  }
});