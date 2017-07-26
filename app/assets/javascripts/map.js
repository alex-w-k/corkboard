
                    function initMap() {
                        var location = {
                            lat: <%= @location.lat %>,
                            lng: <%= @location.lng %>
                        };
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
                            radius: <%= @radius.to_i * 1609.34 %>
                        });
                    }

