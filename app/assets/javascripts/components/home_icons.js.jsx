var HomeIcons = React.createClass({
  render: function() {
    return(
        <div className="icons icons-container">
          <div className="icons-row">
            <Icon href="hire/home-improvement" 
                  id="home-link" 
                  className="fa fa-home" 
                  name="Home Improvement"/>

            <Icon href="hire/events" 
                  id="events-link" 
                  className="fa fa-calendar" 
                  name="Events"/>   

            <Icon href="hire/lessons" 
                  id="lessons-link" 
                  className="fa fa-graduation-cap" 
                  name="Lessons"/>

            <Icon href="hire/wellness" 
                  id="wellness-link"
                  className="fa fa-heartbeat" 
                  name="Wellness"/>

            <Icon href="hire/more/business" 
                  id="business-link" 
                  className="fa fa-briefcase" 
                  name="Business"/>

            <Icon href="hire/more/crafts" 
                  id="crafts-link" 
                  className="fa fa-paint-brush" 
                  name="Crafts"/>

            <Icon href="hire/more/design-web" 
                  id="design-web-link" 
                  className="fa fa-desktop" 
                  name="Design/Web"/>

            <Icon href="hire//more/pets" 
                  id="pets-link"
                  className="fa fa-paw" 
                  name="Pets"/>
          </div>
        </div>     
    )
  }
});
