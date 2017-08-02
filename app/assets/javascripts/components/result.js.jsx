
var Result = React.createClass({
  propTypes: {
    name: React.PropTypes.string,
    uri: React.PropTypes.string,
  },
  getInitialState: function() {
    return {class: 'result'}
  },
  handleClick: function(){
    this.setState({class: 'click-res'})
  },
  render: function() {
    var result = this.props.result;
    return(
      <a href={result.uri} className={this.state.class} onClick={this.handleClick}>
        <div>
        <h4>{result.name}</h4>
        </div>
      </a>
    )
  }
});