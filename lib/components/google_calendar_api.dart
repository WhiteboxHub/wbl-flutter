// import 'dart:io';

// import 'package:googleapis/calendar/v3.dart' as calendar;
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class GoogleCalendarApi {
//   final _clientId = 'YOUR_CLIENT_ID';
//   final _clientSecret = 'YOUR_CLIENT_SECRET';
//   final _scopes = [calendar.CalendarApi.calendarScope];

//   Future<void> authenticate() async {
//     var client = await clientViaUserConsent(
//       ClientId(_clientId, _clientSecret),
//       _scopes,
//       (url) {
//         print('Please go to the following URL:');
//         print(url);
//         print('And grant permission, then paste the authorization code here:');
//         stdout.write('Enter the authorization code: ');
//         var code = stdin.readLineSync();
//         return code
//         ;
//       },
//     );

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
import 'dart:convert';

class GoogleCalendarApi {
  final _clientId = 'YOUR_CLIENT_ID';
  final _clientSecret = 'YOUR_CLIENT_SECRET';
  final _scopes = [calendar.CalendarApi.calendarScope];

  Future<void> authenticate() async {
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
    print('Upcoming events:');
    if (events.items != null) {
      for (var event in events.items!) {
        print(event.summary);
      }
    } else {
      print('No upcoming events found.');
    }
  }
}
