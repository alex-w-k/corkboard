function initMap() {
  var location = {
    lat: Number(document.getElementById('lat').textContent),
    lng: Number(document.getElementById('lng').textContent)
  };
  var radius = Number(document.getElementById('radius').textContent) * 1609.34;
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 9,
    center: location
  });
  var marker = new google.maps.Marker({
    position: location,
    map: map
  });
  var cityCircle = new google.maps.Circle({
    strokeColor: '#FF0000',
    strokeOpacity: 0.8,
    strokeWeight: 2,
    fillColor: '#FF0000',
    fillOpacity: 0.35,
    map: map,
    center: location,
    radius: radius
  });
}

