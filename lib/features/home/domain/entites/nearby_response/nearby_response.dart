import 'geometry.dart';
import 'photo.dart';
import 'plus_code.dart';

class NearbyListRespone {
  final List? items;

  NearbyListRespone({required this.items});

  factory NearbyListRespone.fromJson(Map<String, dynamic> json) =>
      NearbyListRespone(
          items: (json['results'] as List?)
              !.map((e) => NearbyResponse.fromJson(e as Map<String, dynamic>))
              .toList());
}

class NearbyResponse {
  String? businessStatus;
  Geometry? geometry;
  String? icon;
  String? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? name;
  List<Photo>? photos;
  String? placeId;
  PlusCode? plusCode;
  num? rating;
  String? reference;
  String? scope;
  List? types;
  int? userRatingsTotal;
  String? vicinity;

  NearbyResponse({
    this.businessStatus,
    this.geometry,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.name,
    this.photos,
    this.placeId,
    this.plusCode,
    this.rating,
    this.reference,
    this.scope,
    this.types,
    this.userRatingsTotal,
    this.vicinity,
  });

  factory NearbyResponse.fromJson(Map<String, dynamic> json) {
    return NearbyResponse(
      businessStatus: json['business_status'] as String?,
      geometry: json['geometry'] == null
          ? null
          : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      icon: json['icon'] as String?,
      iconBackgroundColor: json['icon_background_color'] as String?,
      iconMaskBaseUri: json['icon_mask_base_uri'] as String?,
      name: json['name'] as String?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      placeId: json['place_id'] as String?,
      plusCode: json['plus_code'] == null
          ? null
          : PlusCode.fromJson(json['plus_code'] as Map<String, dynamic>),
      rating: json['rating'] as num?,
      reference: json['reference'] as String?,
      scope: json['scope'] as String?,
      types: json['types'] as List?,
      userRatingsTotal: json['user_ratings_total'] as int?,
      vicinity: json['vicinity'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'business_status': businessStatus,
        'geometry': geometry?.toJson(),
        'icon': icon,
        'icon_background_color': iconBackgroundColor,
        'icon_mask_base_uri': iconMaskBaseUri,
        'name': name,
        'photos': photos?.map((e) => e.toJson()).toList(),
        'place_id': placeId,
        'plus_code': plusCode?.toJson(),
        'rating': rating,
        'reference': reference,
        'scope': scope,
        'types': types,
        'user_ratings_total': userRatingsTotal,
        'vicinity': vicinity,
      };
}
