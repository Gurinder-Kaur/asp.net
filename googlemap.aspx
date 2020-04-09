<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="googlemap.aspx.cs" Inherits="RestaurantFinder.googlemap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Places Search Box</title>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
       #container{
            border:1px solid;
             border-color:#009900;
             height: 700px;
             width: 100%;
             position:relative;
             margin: 0;
             padding: 0;
        }
        #map {
            height: 100%;
            width: 100%;
            position:absolute;
            background-color:grey;
        }
        html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
         #panel {
         height: 100%;
         width: null;
         background-color: cadetblue;
         position: fixed;
         z-index: 1;
         overflow-x: hidden;
         transition: all .2s ease-out;
       }
         #above{
           background-color: cadetblue;
              border:1px solid;
             border-color:cadetblue;;
            position:absolute;
            top:0px;
            right:0px;
             height: 50px;
             width: 100%;
             font-family:Algerian;
             font-size:medium;
             text-align:center;
         }
          #below{
                border:1px solid;
             border-color:cadetblue;;
            position:absolute;
            bottom:0px;
            right:0px;
             height: 650px;
             width: 100%;
         }
         .open {
          width: 250px;
       }
          .hero {
          width: 100%;
          height: auto;
          max-height: 166px;
          display: block;
        }

          .place,
           p {
          font-family: 'open sans', arial, sans-serif;
          padding-left: 18px;
          padding-right: 18px;
        }

            .details {
              color: #091d3d;
            }
       #options {
              text-decoration: none;
              color: cadetblue;
            }
     
       .dropdown {
              position: relative;
              display: inline-block;
            }

    </style>
  </head>
  <body>
     <div id ="container">
         <div id ="above">
             
             <div class="dropdown">
                 <select id="options">
                    <option value="1">Petrol Pumps</option>
                    <option value="2">Restaurant</option>
                    <option value="3">Hotels</option>
                     <option value="4">Pubs</option>
                     <option value="5">Cafes</option>
                     <option value="6">Atm</option>
                     <option value="7">Hospitals</option>
                     <option value="8">Gas Stations</option>
                 </select>
                <input id="searchInput" class="controls" type="text" placeholder="Search Box">
              
             </div>

        </div>
        <div id="below">
                
                <div id="panel"></div>
                <div id="map"></div>
        </div>
     </div>
    
   
    <script type="text/javascript">
        let pos;
        let map;
        let bounds;
        let infoWindow;
        let currentInfoWindow;
        let service;
        let infoPane;
        let place;
        let input;
        let autocomplete;
        function initAutocomplete() {
            bounds = new google.maps.LatLngBounds();
            infowindow = new google.maps.InfoWindow;
             currentInfoWindow = infoWindow;
            infoPane = document.getElementById('panel');
                map = new google.maps.Map(document.getElementById('map'), {
                  center: {lat: -33.8688, lng: 151.2195},
                  zoom: 13
                });
                input = document.getElementById('searchInput');
                map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

                autocomplete = new google.maps.places.Autocomplete(input);
                autocomplete.bindTo('bounds', map);

                var marker = new google.maps.Marker({
                    map: map,
                    anchorPoint: new google.maps.Point(0, -29)
                });

                autocomplete.addListener('place_changed', function() {
                    infowindow.close();
                    marker.setVisible(false);
                    place = autocomplete.getPlace();
                    if (!place.geometry) {
                        window.alert("Autocomplete's returned place contains no geometry");
                        return;
                    }
  
                    // If the place has a geometry, then present it on a map.
                    if (place.geometry.viewport) {
                        map.fitBounds(place.geometry.viewport);
                    } else {
                        map.setCenter(place.geometry.location);
                        map.setZoom(17);
                    }
                    marker.setIcon(({
                        url: place.icon,
                        size: new google.maps.Size(71, 71),
                        origin: new google.maps.Point(0, 0),
                        anchor: new google.maps.Point(17, 34),
                        scaledSize: new google.maps.Size(35, 35)
                    }));
                    marker.setPosition(place.geometry.location);
                    marker.setVisible(true);
                    getNearbyPlaces(place.geometry.location);
                    

                }, () => {
          
                        handleLocationError(true, infoWindow);
                       }

                );
                       
        }
         function handleLocationError(browserHasGeolocation, infoWindow) {
      // Set default location to Sydney, Australia
              pos = { lat: -33.856, lng: 151.215 };
              map = new google.maps.Map(document.getElementById('map'), {
                    center: pos,
                    zoom: 15
              });

      // Display an InfoWindow at the map center
              infoWindow.setPosition(pos);
              infoWindow.setContent(browserHasGeolocation ?
                'Geolocation permissions denied. Using default location.' :
                'Error: Your browser doesn\'t support geolocation.');
              infoWindow.open(map);
              currentInfoWindow = infoWindow;

              // Call Places Nearby Search on the default location
              getNearbyPlaces(pos);
         }
        
            
         
       
        
        
        function getNearbyPlaces(position) {
            let e = document.getElementById("options");
            let key = e.options[e.selectedIndex].text;
            let request = {
                location: position,
                rankBy: google.maps.places.RankBy.DISTANCE,
                keyword: key
            };
             service = new google.maps.places.PlacesService(map);
             service.nearbySearch(request, nearbycallback);
        }

        function nearbycallback(results, status) {
             if (status == google.maps.places.PlacesServiceStatus.OK) {
                  
                       createMarkers(results);
                  
             }
        }

       function createMarkers(places) {
              places.forEach(place => {
                    let marker = new google.maps.Marker({
                          position: place.geometry.location,
                          map: map,
                          title: place.name
                    });

       
            // Add click listener to each marker
              google.maps.event.addListener(marker, 'click', () => {
                      let request = {
                        placeId: place.place_id,
                        fields: ['name', 'formatted_address', 'geometry', 'rating',
                          'website', 'photos']
                      };

                  /* Only fetch the details of a place when the user clicks on a marker.
                   * If we fetch the details for all place results as soon as we get
                   * the search response, we will hit API rate limits. */
                     service.getDetails(request, (placeResult, status) => {
                      showDetails(placeResult, marker, status)
                          });
                        });

            // Adjust the map bounds to include the location of this marker
                        bounds.extend(place.geometry.location);
                      });
          /* Once all the markers have been placed, adjust the bounds of the map to
                   * show all the markers within the visible area. */
                  map.fitBounds(bounds);
        }

        function showDetails(placeResult, marker, status) {
             if (status == google.maps.places.PlacesServiceStatus.OK) {
                   let placeInfowindow = new google.maps.InfoWindow();
                   let rating = "None";
                   if (placeResult.rating) rating = placeResult.rating;
                   placeInfowindow.setContent('<div><strong>' + placeResult.name +
                    '</strong><br>' + 'Rating: ' + rating + '</div>');
                    placeInfowindow.open(marker.map, marker);
                    currentInfoWindow.close();
                    currentInfoWindow = placeInfowindow;
                 showPanel(placeResult);
                 
             } else {
                console.log('showDetails failed: ' + status);
             }
        }

        function showPanel(placeResult) {
      // If infoPane is already open, close it
              if (infoPane.classList.contains("open")) {
                infoPane.classList.remove("open");
              }

      // Clear the previous details
              while (infoPane.lastChild) {
                infoPane.removeChild(infoPane.lastChild);
              }

      // Add the primary photo, if there is one
              if (placeResult.photos) {
                    let firstPhoto = placeResult.photos[0];
                    let photo = document.createElement('img');
                    photo.classList.add('hero');
                    photo.src = firstPhoto.getUrl();
                    infoPane.appendChild(photo);
              }

      // Add place details with text formatting
              let name = document.createElement('h1');
              name.classList.add('place');
              name.textContent = placeResult.name;
              infoPane.appendChild(name);
              if (placeResult.rating) {
                    let rating = document.createElement('p');
                    rating.classList.add('details');
                    rating.textContent = `Rating: ${placeResult.rating} \u272e`;
                    infoPane.appendChild(rating);
              }
              let address = document.createElement('p');
              address.classList.add('details');
              address.textContent = placeResult.formatted_address;
              infoPane.appendChild(address);
              if (placeResult.website) {
                    let websitePara = document.createElement('p');
                    let websiteLink = document.createElement('a');
                    let websiteUrl = document.createTextNode(placeResult.website);
                    websiteLink.appendChild(websiteUrl);
                    websiteLink.title = placeResult.website;
                    websiteLink.href = placeResult.website;
                    websitePara.appendChild(websiteLink);
                    infoPane.appendChild(websitePara);
              }

      // Open the infoPane
            infoPane.classList.add("open");
          
        }


    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCvUPErwa9PmmbekI2HR5AiIiweaZN_XDY&libraries=places&callback=initAutocomplete">
         async defer></script>
  </body>
</html>