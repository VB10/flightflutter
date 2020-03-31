// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_map_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightMap _$FlightMapFromJson(Map<String, dynamic> json) {
  return FlightMap(
    country: json['country'] as String,
    detail: json['detail'] == null
        ? null
        : Detail.fromJson(json['detail'] as Map<String, dynamic>),
    lat: (json['lat'] as num)?.toDouble(),
    long: (json['long'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FlightMapToJson(FlightMap instance) => <String, dynamic>{
      'country': instance.country,
      'detail': instance.detail,
      'lat': instance.lat,
      'long': instance.long,
    };

Detail _$DetailFromJson(Map<String, dynamic> json) {
  return Detail(
    description: json['description'] as String,
    name: json['name'] as String,
    photoUrl: json['photoUrl'] as String,
    status: json['status'] as String,
    tags: (json['tags'] as List)
        ?.map(
            (e) => e == null ? null : Tags.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'status': instance.status,
      'tags': instance.tags,
    };

Tags _$TagsFromJson(Map<String, dynamic> json) {
  return Tags(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$TagsToJson(Tags instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
