var ready = function () {
  var autocompleteElement = document.getElementById('autocomplete');
  if(autocompleteElement) {
    var componentForm = {
      street_number:               'short_name',
      route:                       'long_name',
      locality:                    'long_name',
      administrative_area_level_1: 'short_name',
      administrative_area_level_2: 'long_name',
      country:                     'short_name',
      postal_code:                 'short_name'
    };
    var autocomplete = new google.maps.places.Autocomplete(
      autocompleteElement, { types: ['geocode'] });

    autocomplete.addListener('place_changed', function () {
      var place = autocomplete.getPlace();
      for (var component in componentForm) {
        document.getElementById(component).value = '';
        document.getElementById(component).disabled = false;
      }

      for (var i = 0; i < place.address_components.length; i++) {
        var addressType = place.address_components[i].types[0];
        if (componentForm[addressType]) {
          var val = place.address_components[i][componentForm[addressType]];
          document.getElementById(addressType).value = val;
        }
      }

      var staticMapInput = document.getElementById('property_static_map');
      var imageElement = document.getElementById('static_map');
      var template = "https://maps.googleapis.com/maps/api/staticmap?key=AIzaSyBJy_FqsPO7SZxzRP0aqvbSiXOKdcpnvDg&size=280x280&markers=color:red|{formatted_address}"
      var imageUrl = template.replace(/\{formatted_address\}/g, place.formatted_address);

      imageElement.src = encodeURI(imageUrl);
      staticMapInput.value = imageUrl;

    });
  }
}
$(document).on('page:load', ready);
$(document).ready(ready);
