
var Result = React.createClass({
  propTypes: {
    name: React.PropTypes.string,
    uri: React.PropTypes.string,
  },
  render: function() {
    var result = this.props.result;
    return(
      <a href={result.uri} className='result'>
        <div>
        <h4>{result.name}</h4>
        </div>
      </a>
    )
  }
});