var API = 'http://localhost:3000/api/v1/projects';

$(document).ready(function() {

  getOpenProjects();
  getAcceptedProjects();
  getCompletedProjects();
});

var submitClose = function() {
    $('.close-form').on('submit', function(event){
      var id = $('input[name=project_id]').val();
      var token = $('input[name=token]').val();
      updateProject(id, token);
  });
}

var getOpenProjects = function() {
  var user_div = $('#user')
  var user = user_div.data("user");
  $('.open-project').empty();
  return $.ajax({
    url: API + `/find_all?requester_id=${user}&status=0`,
    method: 'GET',
  }).done(function(projects) {
    if (projects.length > 0) {
      projects.forEach(function(project){
        $('.open-project').append('<li class="list-group-item"><p><span class="project-label">Service: </span>' + project.service.name + '</p><p><span class="project-label">Description: </span>' + project.description + '</p><p><span class="project-label">Timeline: </span>' + project.timeline + '</p><p><a href="/projects/' + project.id + '" class="btn btn-primary" role="button">View Details and Bids</a></p></li>')
      })
    } else {
      $('.open-project').append('<li class="list-group-item"><p>You have no open projects</p>')
    }
  }).fail(function(error) {
    console.log(error);
  })
};

var getAcceptedProjects = function() {
  var user_div = $('#user')
  var user = user_div.data("user");
  var token_div = $('#token')
  var token = token_div.data("token");
  $('.accepted-project').empty();
  return $.ajax({
    url: API + `/find_all?requester_id=${user}&status=1`,
    method: 'GET',
  }).done(function(projects) {
    if (projects.length > 0) {
      projects.forEach(function(project){
        $('.accepted-project').append('<li class="list-group-item"><p><span class="project-label">Service: </span>' + project.service.name + '</p><p><span class="project-label">Description: </span>' + project.description + '</p><p><span class="project-label">Timeline: </span>' + project.timeline + '</p><p><form class="close-form"><input type="hidden" name="token" value=' + token + '><input type="hidden" name="project_id" value="' + project.id + '"><span class="accepted-buttons"><input type="submit" value="Mark as Complete" class="btn btn-warning"></form><a href="/projects/' + project.id + '" class="btn btn-primary" role="button">View Details and Bids</a></span></p></li>')
      })
      submitClose();
    } else { 
      $('.accepted-project').append('<li class="list-group-item"><p>You have no accepted projects</p>')
    }
      }).fail(function(error) {
        console.log(error);
      })
};

var getCompletedProjects = function() {
  var user_div = $('#user')
  var user = user_div.data("user");
  $('.closed-project').empty();
  return $.ajax({
    url: API + `/find_all?requester_id=${user}&status=2`,
    method: 'GET',
  }).done(function(projects) {
    if (projects.length > 0) {
      projects.forEach(function(project){
        $('.closed-project').append('<li class="list-group-item"><p><span class="project-label">Service: </span>' + project.service.name + '</p><p><span class="project-label">Description: </span>' + project.description + '</p><p><span class="project-label">Timeline: </span>' + project.timeline + '</p><p><a href="/projects/' + project.id + '" class="btn btn-primary" role="button">View Details and Bids</a></p></li>')
      })
    } else { 
      $('.closed-project').append('<li class="list-group-item"><p>You have no closed projects</p>')
    }
  }).fail(function(error) {
    console.log(error);
  })
};

var updateProject = function(id, token) {
  return $.ajax({
    url: API + '/' + id,
    method: 'PUT',
    data: {project: {status: 'closed', token: token}},
  }).done(function() {
    $('.accepted-project').empty();
    $('.closed-project').empty();
    getAcceptedProjects();
    getCompletedProjects();
  }).fail(function(error) {
    alert("Something went wrong. We feel terrible.");
    console.log(error);
  })
};
