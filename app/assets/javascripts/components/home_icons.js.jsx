
var HomeIcons = React.createClass({
  showsLabel: function(e) {
    e.target.parentElement.nextElementSibling.style.display = 'block';
  },
  hidesLabel: function(e){
    e.target.parentElement.nextElementSibling.style.display = 'none';
  },
  render: function() {
    return(
        <div className="icons icons-container">
          <div className="icons-row">
              <div className="icon">
                <a href="hire/home-improvement" id="home-link">
                <i onMouseEnter={this.showsLabel} onMouseLeave={this.hidesLabel} className="fa fa-home"></i>
                </a>
                  <span className='icon-label'>Home Improvemnt</span>
              </div>
              <div className="icon"><a href="hire/events" id="events-link">
              <i onMouseEnter={this.showsLabel} onMouseLeave={this.hidesLabel} className="fa fa-calendar"></i></a>
                  <span className='icon-label'>Events</span>
              </div>
              <div className="icon"><a href="hire/lessons" id="lessons-link">
              <i onMouseEnter={this.showsLabel} onMouseLeave={this.hidesLabel} className="fa fa-graduation-cap"></i></a>
                  <span className='icon-label'>Lessons</span>
              </div>
              <div className="icon"><a href="hire/wellness" id="wellness-link">
              <i onMouseEnter={this.showsLabel} onMouseLeave={this.hidesLabel} className="fa fa-heartbeat"></i></a>
                  <span className='icon-label'>Wellness</span>
              </div>
              <div className="icon"><a href="hire/more/business" id="business-link">
              <i onMouseEnter={this.showsLabel} onMouseLeave={this.hidesLabel} className="fa fa-briefcase"></i></a>
                  <span className='icon-label'>Business</span>
              </div>
              <div className="icon"><a href="hire/more/crafts" id="crafts-link">
              <i onMouseEnter={this.showsLabel} onMouseLeave={this.hidesLabel} className="fa fa-paint-brush"></i></a>
                  <span className='icon-label'>Crafts</span>
              </div>
              <div className="icon"><a href="hire/more/design-web" id="design-web-link">
              <i onMouseEnter={this.showsLabel} onMouseLeave={this.hidesLabel} className="fa fa-desktop"></i></a>
                  <span className='icon-label'>Design/Web</span>
              </div>
              <div className="icon"><a href="hire/more/pets" id="pets-link">
              <i onMouseEnter={this.showsLabel} onMouseLeave={this.hidesLabel} className="fa fa-paw"></i></a>
                  <span className='icon-label'>Pets</span>
              </div>
          </div>
        </div>    
    
    )
  }
});