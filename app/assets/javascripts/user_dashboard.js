$(document).ready(function() {
    getOpenProjects();
    getAcceptedProjects();
    getCompletedProjects();
});

var submitClose = function() {
    $('.close-form').on('submit', function(event) {
        var id = $('input[name=project_id]').val();
        var token = $('input[name=token]').val();
        updateProject(id, token);
    });
}

var getOpenProjects = function() {
    $('.open').empty();
    return $.ajax({
        url: API + `/find_all?requester_id=${user}&status=0`,
        method: 'GET',
    }).done(function(projects) {
        projects.forEach(function(project) {
            $('.open').append('<li class="list-group-item"><p><a href="/projects/' + project.id + '">View Project and Bids</a></p><p>Service: ' + project.service_id + '</p><p>Description: ' + project.description + '</p><p>Timeline: ' + project.timeline + '</p></li>')
        })
    }).fail(function(error) {
        console.log(error);
    })
};

var getAcceptedProjects = function() {
    var token_div = $('#token')
    var token = token_div.data("token");
    $('.accepted').empty();
    return $.ajax({
        url: API + `/find_all?requester_id=${user}&status=1`,
        method: 'GET',
    }).done(function(projects) {
        projects.forEach(function(project) {
            $('.accepted').append('<li class="list-group-item"><p><a href="/projects/' + project.id + '">View Project and Bids</a><p>Service: ' + project.service_id + '</p><p>Description: ' + project.description + '</p><p>Timeline: ' + project.timeline + '</p><p><form class="close-form"><input type="hidden" name="token" value=' + token + '><input type="hidden" name="project_id" value="' + project.id + '"><input type="submit" value="Mark as Complete" class="btn btn-warning"></form></p></li>')
        })
        submitClose();
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
        projects.forEach(function(project) {
            $('.closed').append('<li class="list-group-item"><p><a href="/projects/' + project.id + '">View Project and Bids</a></p><p>Service: ' + project.service_id + '</p><p>Description: ' + project.description + '</p><p>Timeline: ' + project.timeline + '</p></li>')
        })
    }).fail(function(error) {
        console.log(error);
    })
};

var updateProject = function(id, token) {
    return $.ajax({
        url: API + '/' + id,
        method: 'PUT',
        data: { project: { status: 'closed', token: token } },
    }).done(function() {
        $('.accepted').empty();
        $('.closed').empty();
        getAcceptedProjects();
        getCompletedProjects();
    }).fail(function(error) {
        alert("Something went wrong. We feel terrible.");
        console.log(error);
    })
};

