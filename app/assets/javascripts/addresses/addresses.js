initMap = (data, key) => {
  const map_markers = [];
  const labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  let labelIndex = 0;
  const addresses = data.filter(a => a.lat != null);
  const options = {
    zoom: 7,
    center: { lat: addresses[0].lat, lng: addresses[0].lng },
  };
  const map = new google.maps.Map(document.getElementById('map'), options);

  toggleBounce = marker => {
    if (marker.getAnimation() !== null) {
      marker.setAnimation(null);
    } else {
      marker.setAnimation(google.maps.Animation.BOUNCE);
    }
  };

  addMarker = props => {
    const marker = new google.maps.Marker({
      position: { lat: props.lat, lng: props.lng },
      map: map,
      label: labels[labelIndex++ % labels.length],
      animation: google.maps.Animation.DROP,
    });

    const infoWindow = new google.maps.InfoWindow({
      content: `<div style='text-align: center;'>
      <h4>${props.Address}</h4>
      <table>
      <tr><th>Customer:</th><td>${props.Customer}</td></tr>
      <tr><th>Technical Contact:</th><td>${props['Name of Technical Contact']}</td></tr>
      <tr><th>Floors:</th><td>${props.Floors}</td></tr>
      <tr><th>Battery Number:</th><td>${props.Batteries}</td></tr>
      <tr><th>Column Number:</th><td>${props.Columns}</td></tr>
      <tr><th>Elevator Number:</th><td>${props.Elevators}</td></tr>
      </table>
      <h6>Streetview Photo</h6>
      <img src=https://maps.googleapis.com/maps/api/streetview?size=300x150&location=${props.lat},${props.lng}&heading=151.78&pitch=-0.76&key=${key} height="100"></img></div>
      `,
    });
    marker.addListener('click', () => {
      infoWindow.open(map, marker);
      toggleBounce(marker);
    });
    return marker;
  };
  addresses.forEach(e => map_markers.push(addMarker(e)));

  new MarkerClusterer(map, map_markers, {
    maxZoom: 20,
    imagePath:
      'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m',
  });
};
