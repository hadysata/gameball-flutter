import 'dart:convert';

import 'package:flutter/foundation.dart';

/// Represents an event to be sent to the Gameball API.
///
/// This class defines the structure of an event object with properties
/// for event data, player unique ID, optional mobile number, and optional email.
class Event {
  /// A map containing the actual event data.
  /// The key represents the event type, and the value is a map containing additional event-specific data.
  Map<String, Map<String, dynamic>?> events;

  /// The unique identifier of the player associated with the event.
  String? playerUniqueId;

  /// The player's mobile number (optional).
  String? mobileNumber;

  /// The player's email address (optional).
  String? email;

  /// Creates a new `Event` object.
  ///
  /// Arguments:
  ///   - `events`: The event data map (required).
  ///   - `playerUniqueId`: The player's unique ID (optional).
  ///   - `mobileNumber`: The player's mobile number (optional).
  ///   - `email`: The player's email address (optional).
  Event({
    required this.events,
    this.playerUniqueId,
    this.mobileNumber,
    this.email,
  });

  Event copyWith({
    Map<String, Map<String, dynamic>?>? events,
    ValueGetter<String?>? playerUniqueId,
    ValueGetter<String?>? mobileNumber,
    ValueGetter<String?>? email,
  }) {
    return Event(
      events: events ?? this.events,
      playerUniqueId: playerUniqueId != null ? playerUniqueId() : this.playerUniqueId,
      mobileNumber: mobileNumber != null ? mobileNumber() : this.mobileNumber,
      email: email != null ? email() : this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'events': events,
      'playerUniqueId': playerUniqueId,
      'mobileNumber': mobileNumber,
      'email': email,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      events: Map<String, Map<String, dynamic>?>.from(map['events']),
      playerUniqueId: map['playerUniqueId'],
      mobileNumber: map['mobileNumber'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) => Event.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Event(events: $events, playerUniqueId: $playerUniqueId, mobileNumber: $mobileNumber, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Event &&
        mapEquals(other.events, events) &&
        other.playerUniqueId == playerUniqueId &&
        other.mobileNumber == mobileNumber &&
        other.email == email;
  }

  @override
  int get hashCode {
    return events.hashCode ^ playerUniqueId.hashCode ^ mobileNumber.hashCode ^ email.hashCode;
  }
}
