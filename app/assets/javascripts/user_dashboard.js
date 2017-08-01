var API = 'http://localhost:3000/api/v1/projects';

$(document).ready(function(){
  getOpenProjects()
});

var getOpenProjects = function() {
  return $.ajax({
    url: API + `/find_all?requester_id=${user}&status=0`,
    method: 'GET',
  }).done(function(projects) {
    projects.forEach(function(project){
      $('.open .list-group-item').append('<p>Service: ' + project.service_id + '</p><p>Description: ' + project.description + '</p><p>Timeline: ' + project.timeline + '</p>')
    })
  }).fail(function(error) {
    console.log(error);
  })
};

