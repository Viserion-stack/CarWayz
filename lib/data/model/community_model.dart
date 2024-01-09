import 'dart:convert';

import 'package:flutter/foundation.dart';

class Community {
  final String id;
  final String name;
  final String banner;
  final String avatar;
  final List<String> likes;
  final List<String> saved;
  final List<String> members;
  final List<String> mods;
  Community({
    required this.id,
    required this.name,
    required this.banner,
    required this.avatar,
    required this.likes,
    required this.saved,
    required this.members,
    required this.mods,
  });

  Community copyWith({
    String? id,
    String? name,
    String? banner,
    String? avatar,
    List<String>? likes,
    List<String>? saved,
    List<String>? members,
    List<String>? mods,
  }) {
    return Community(
      id: id ?? this.id,
      name: name ?? this.name,
      banner: banner ?? this.banner,
      avatar: avatar ?? this.avatar,
      likes: likes ?? this.likes,
      saved: saved ?? this.saved,
      members: members ?? this.members,
      mods: mods ?? this.mods,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'banner': banner,
      'avatar': avatar,
      'likes': likes,
      'saved': saved,
      'members': members,
      'mods': mods,
    };
  }

  factory Community.fromMap(Map<String, dynamic> map) {
    return Community(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      banner: map['banner'] ?? '',
      avatar: map['avatar'] ?? '',
      likes: List<String>.from(map['likes'] ?? []),
      saved: List<String>.from(map['saved'] ?? []),
      members: List<String>.from(map['members'] ?? []),
      mods: List<String>.from(map['mods'] ?? []),
    );
  }

  @override
  String toString() {
    return 'Community(id: $id, name: $name, banner: $banner, avatar: $avatar, likes: $likes, saved: $saved, members: $members, mods: $mods)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Community &&
        other.id == id &&
        other.name == name &&
        other.banner == banner &&
        other.avatar == avatar &&
        listEquals(other.likes, likes) &&
        listEquals(other.saved, saved) &&
        listEquals(other.members, members) &&
        listEquals(other.mods, mods);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        banner.hashCode ^
        avatar.hashCode ^
        likes.hashCode ^
        saved.hashCode ^
        members.hashCode ^
        mods.hashCode;
  }

  String toJson() => json.encode(toMap());

  factory Community.fromJson(String source) =>
      Community.fromMap(json.decode(source));
}
