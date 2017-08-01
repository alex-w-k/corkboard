var API = 'http://localhost:3000/api/v1/projects';

$(document).ready(function(){
  getOpenProjects();
  getAcceptedProjects();
  getCompletedProjects();
  $('.close-form').submit(function() {
  var status = $('input[name=status]').val();
  var id = $('input[name=project_id]').val();
  updateProject(status);
  })
});

var getOpenProjects = function() {
  $('.open').empty();
  return $.ajax({
    url: API + `/find_all?requester_id=${user}&status=0`,
    method: 'GET',
  }).done(function(projects) {
    projects.forEach(function(project){
      $('.open').append('<li class="list-group-item"><p><a href="/projects/' + project.id + '">View Project and Bids</a></p><p>Service: ' + project.service_id + '</p><p>Description: ' + project.description + '</p><p>Timeline: ' + project.timeline + '</p></li>')
    })
  }).fail(function(error) {
    console.log(error);
  })
};

var getAcceptedProjects = function() {
  $('.accepted').empty();
  return $.ajax({
    url: API + `/find_all?requester_id=${user}&status=1`,
    method: 'GET',
  }).done(function(projects) {
    projects.forEach(function(project){
      $('.accepted').append('<li class="list-group-item"><p><a href="/projects/' + project.id + '">View Project and Bids</a><p>Service: ' + project.service_id + '</p><p>Description: ' + project.description + '</p><p>Timeline: ' + project.timeline + '</p><p><form class="close-form"><input type="hidden" name="status" value="2"><input type="hidden" name="project_id" value="' + project.id + '"><input type="submit" value="Mark as Complete" class="btn btn-warning"></form></p></li>')
    })
  }).fail(function(error) {
    console.log(error);
  })
};

var getCompletedProjects = function() {
  $('.closed').empty();
  return $.ajax({
    url: API + `/find_all?requester_id=${user}&status=2`,
    method: 'GET',
  }).done(function(projects) {
    projects.forEach(function(project){
      $('.closed').append('<li class="list-group-item"><p><a href="/projects/' + project.id + '">View Project and Bids</a></p><p>Service: ' + project.service_id + '</p><p>Description: ' + project.description + '</p><p>Timeline: ' + project.timeline + '</p></li>')
    })
  }).fail(function(error) {
    console.log(error);
  })
};

var updateProject = function(id, status) {
  return $.ajax({
    url: API + `/find_all?id=${id}`,
    method: 'PUT',
    data: {project: {status: status}},
  }).done(function() {
    $('.accepted').empty();
    $('.closed').empty();
    getAcceptedProjects();
    getCompletedProjects();
  })
};
