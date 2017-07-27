
var HomeIcons = React.createClass({
  render: function() {
    return(
        <div className="icons icons-container">
          <div className="icons-row">
              <div className="icon"><a href="hire/home-improvement" id="home-link"><i className="fa fa-home"></i></a>
                  <span className='icon-label'>Home Improvemnt</span>
              </div>
              <div className="icon"><a href="hire/events" id="events-link"><i className="fa fa-calendar"></i></a>
                  <span className='icon-label'>Events</span>
              </div>
              <div className="icon"><a href="hire/lessons" id="lessons-link"><i className="fa fa-graduation-cap"></i></a>
                  <span className='icon-label'>Lessons</span>
              </div>
              <div className="icon"><a href="hire/wellness" id="wellness-link"><i className="fa fa-heartbeat"></i></a>
                  <span className='icon-label'>Wellness</span>
              </div>
              <div className="icon"><a href="hire/more/business" id="business-link"><i className="fa fa-briefcase"></i></a>
                  <span className='icon-label'>Business</span>
              </div>
              <div className="icon"><a href="hire/more/crafts" id="crafts-link"><i className="fa fa-paint-brush"></i></a>
                  <span className='icon-label'>Crafts</span>
              </div>
              <div className="icon"><a href="hire/more/design-web" id="design-web-link"><i className="fa fa-desktop"></i></a>
                  <span className='icon-label'>Design/Web</span>
              </div>
              <div className="icon"><a href="hire/more/pets" id="pets-link"><i className="fa fa-paw"></i></a>
                  <span className='icon-label'>Pets</span>
              </div>
          </div>
        </div>    
    
    )
  }
});