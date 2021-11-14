class Location {
  late double lat;
  late double lng;

  Location({required this.lat, required this.lng});

  //----------------------------------------------------------------------------
  //----------------------- Create Forecast from JSON --------------------------
  //----------------------------------------------------------------------------

  static Location fromJson(dynamic json){
    var lat = json["coord"]["lat"].toDouble();
    var lng = json["coord"]["lon"].toDouble();

    return Location(
        lat: lat,
        lng: lng
    );
  }
}