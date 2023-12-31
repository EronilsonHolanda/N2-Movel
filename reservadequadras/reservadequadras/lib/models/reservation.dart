import 'package:flutter/material.dart';
import 'package:reservadequadras/models/enums/status_enum.dart';
import 'package:intl/intl.dart';
import 'package:reservadequadras/models/reservation_color.dart';

class Reservation {
  int id;
  String courtName;
  String time;
  String date;
  String location;
  Status status;

  Reservation({
    required this.id,
    required this.courtName,
    required this.time,
    required this.date,
    required this.location,
    required this.status,
  });

  factory Reservation.fromMap(Map<String, dynamic> map) {
    return Reservation(
      id: map['id'],
      courtName: map['name'],
      time: map['time'],
      date: map['date'],
      location: map['location'],
      status: getStatusEnum(map['status']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': courtName,
      'time': time,
      'date': date,
      'location': location,
      'status': status.name,
    };
  }

  String get getDate {
    final formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.parse(date));
    return formattedDate;
  }

  String get getStatus {
    switch (status) {
      case Status.Reservada:
        return 'Reservada';
      case Status.Livre:
        return 'Livre';
      case Status.Ocupada:
        return 'Ocupada';
      default:
        return '';
    }
  }

  ReservationColor get getStatusColors {
    switch (status) {
      case Status.Reservada:
        return ReservationColor(
            background: Colors.orange, foreground: Colors.black);
      case Status.Livre:
        return ReservationColor(
            background: Colors.green, foreground: Colors.black);
      case Status.Ocupada:
        return ReservationColor(
            background: Colors.red, foreground: Colors.white);
      default:
        return ReservationColor(
            background: Colors.black, foreground: Colors.white);
    }
  }

  static Status getStatusEnum(String statusString) {
    switch (statusString) {
      case 'Reservada':
        return Status.Reservada;
      case 'Livre':
        return Status.Livre;
      case 'Ocupada':
        return Status.Ocupada;
      default:
        return Status.Reservada;
    }
  }
}
