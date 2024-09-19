

// import 'dart:io';
// import 'package:googleapis/calendar/v3.dart' as calendar;
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class GoogleCalendarApi {
//   final _clientId = 'q84dbo0ucqc7evjifhajadmo80@group.calendar.google.com';
//   final _clientSecret = 'AIzaSyDOp2lKANdmMhBRNZWBXA97pQOgF_yoQ3Q';
//   final _scopes = [calendar.CalendarApi.calendarScope];

//   Future<void> authenticate() async {
//     // Create an authorized client
//     var client = await clientViaUserConsent(
//       ClientId(_clientId, _clientSecret),
//       _scopes,
//       (url) async {
//         print('Please go to the following URL:');
//         print(url);
//         print('And grant permission, then paste the authorization code here:');
//       },
//     );

//     // After user has provided consent, fetch events from their Google Calendar
//     var calendarApi = calendar.CalendarApi(client);
//     var events = await calendarApi.events.list('primary');
//     print('Upcoming events:');
//     if (events.items != null) {
//       for (var event in events.items!) {
//         print(event.summary);
//       }
//     } else {
//       print('No upcoming events found.');
//     }
//   }
// }


import 'dart:io';
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class GoogleCalendarApi {
  final _clientId = 'YOUR_CLIENT_ID';
  final _clientSecret = 'YOUR_CLIENT_SECRET';
  final _scopes = [calendar.CalendarApi.calendarScope];

  Future<List<calendar.Event>> getCalendarEvents() async {
    // Create an authorized client
    var client = await clientViaUserConsent(
      ClientId(_clientId, _clientSecret),
      _scopes,
      (url) async {
        print('Please go to the following URL:');
        print(url);
        print('And grant permission, then paste the authorization code here:');
      },
    );

    // After user has provided consent, fetch events from their Google Calendar
    var calendarApi = calendar.CalendarApi(client);
    var events = await calendarApi.events.list('primary');

    if (events.items != null) {
      return events.items!;
    } else {
      print('No upcoming events found.');
      return [];
    }
  }
}
