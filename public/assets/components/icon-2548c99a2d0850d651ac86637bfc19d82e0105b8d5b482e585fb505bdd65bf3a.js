var Icon=React.createClass({displayName:"Icon",propTypes:{href:React.PropTypes.string,id:React.PropTypes.string,className:React.PropTypes.string,name:React.PropTypes.string},showsLabel:function(e){e.target.parentElement.nextElementSibling.style.display="block"},hidesLabel:function(e){e.target.parentElement.nextElementSibling.style.display="none"},render:function(){var e=this.props;return React.createElement("div",{className:"icon"},React.createElement("a",{href:e.href,id:e.id},React.createElement("i",{onMouseEnter:this.showsLabel,onMouseLeave:this.hidesLabel,className:e.className})),React.createElement("span",{className:"icon-label"},e.name))}});