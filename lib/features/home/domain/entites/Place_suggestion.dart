class PlaceSuggestion {
  final String? placeId;
  final String? imageUrl;
  final String? description;
  final String? name;
  double? lat;
  double? lng;

  PlaceSuggestion({
    this.imageUrl,
    this.name,
    this.description,
    this.placeId,
    this.lat,
    this.lng,
  });

  factory PlaceSuggestion.fromJson(Map<String, dynamic> json) =>
      PlaceSuggestion(
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        placeId: json["place_id"] ?? '',
        imageUrl: json["imageurl"] ?? '',
        lat: json['lat'],
        lng: json['lng'],
      );
  factory PlaceSuggestion.fromSugg(Map<String, dynamic> json) =>
      PlaceSuggestion(
        name: json['structured_formatting']['main_text'] ?? '',
        description: json['description'] ?? '',
        placeId: json["place_id"] ?? '',
      );

  factory PlaceSuggestion.fromNewApi(Map<String, dynamic> json) =>
      PlaceSuggestion(
        name: json['displayName']['text'] ?? '',
        description: json['formattedAddress'] ?? '',
        placeId: json["id"] ?? '',
        imageUrl: json["imageurl"] ?? '',
        lat: json['location']['latitude'],
        lng: json['location']['longitude'],
      );

  Map<String, dynamic> toJson() => {
        "place_id": placeId,
        "description": description,
        "lat": lat,
        'lng': lng,
        'name': name
      };
}



// class SavedPlaces{
//   List<PlaceSuggestion>? places;

//   SavedPlaces({ this.places});
//   factory SavedPlaces.fromJson(Map<String, dynamic> json)=>;

// }