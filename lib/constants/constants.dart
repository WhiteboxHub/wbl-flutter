class Constants {
  static const String appName = "Wbl_App";
  static const String appVersion = "1.0.0";
  static const String appAuthor = "Hemant_Ameer";

  static const List<String> dropdownOptions = [
    'Feedback',
    'Technical Support',
    'General Inquiry',
    'Your Data',
    'Partnership',
    'Others',
  ];

  static const List<Map<String, String>> privacyPolicies = [
    {
      'title': 'Information Collection and Use',
      'content': 'We use third party google services to anonymously identify users. Users can request deletion of their information anytime through the contact form. We store data safely on the user\'s device and occasionally synchronize to the cloud. Users agree to use the app as it is, with no guarantees or warranties. We use push notifications and text messages to notify clients, and clients can turn these features off at any time. Clients can opt in for third party device facial ID / touch ID lock and unlock app. We do not share client information. The app is freemium. For any concerns, users should write to us via the contact us form.',
    },
    {
      'title': 'User Consent',
      'content': 'By using the App, users consent to the collection and use of their information as described in this Privacy Policy.',
    },
    {
      'title': 'Data Deletion',
      'content': 'Users can request the deletion of their information at any time by contacting us through the provided contact form within the App.',
    },
    {
      'title': 'Usage Agreement',
      'content': 'Users agree to use the App as it is, understanding that there are no guarantees or warranties provided.',
    },
    {
      'title': 'Notifications',
      'content': 'Push Notifications: We use push notifications to notify users of important updates and information. Users can opt-out of receiving push notifications at any time.\n\nText Messages: Users may also receive notifications via text messages. Similar to push notifications, users can opt-out of receiving text messages at any time.',
    },
    {
      'title': 'Facial ID / Touch ID',
      'content': 'Users have the option to opt-in for third-party device facial ID or touch ID to lock and unlock the App for added security.',
    },
    {
      'title': 'Information Sharing',
      'content': 'We do not share user information with third parties for marketing or advertising purposes.',
    },
    {
      'title': 'Freemium Model',
      'content': 'The App operates on a freemium model, providing basic services for free while offering premium features for a fee.',
    },
    {
      'title': 'Contact Us',
      'content': 'For any privacy concerns or inquiries, users should contact us via the provided contact form within the App.',
    },
    {
      'title': 'Changes to this Privacy Policy',
      'content': 'We reserve the right to update this Privacy Policy at any time. Users are encouraged to frequently check this page for any changes. By continuing to use the App, users acknowledge and agree to the updated Privacy Policy.',
    },
    {
      'title': 'Acceptance of Terms',
      'content': 'By using this App, users signify their acceptance of this Privacy Policy. If users do not agree to this policy, they should not use the App. Continued use of the App following the posting of changes to this policy will be deemed as acceptance of those changes.',
    },
  ];

  static const List<Map<String, String>> termsAndConditions = [
    {
      'title': 'Service Agreement',
      'content': 'By using this app, you agree to the following terms and conditions. The services provided are as they are, and we are not liable for any inaccuracies, interruptions, or errors.',
    },
    {
      'title': 'Prohibited Behavior',
      'content': 'Users are prohibited from engaging in any illegal activities, including but not limited to, unauthorized access, distribution of malware, or any actions that violate the rights of others.',
    },
    {
      'title': 'Payments and Subscriptions',
      'content': 'Subscription payments are non-refundable. Payments are processed securely through Stripe, Apple Pay, and Google Pay. Users are responsible for managing their subscriptions through their respective platforms.',
    },
    {
      'title': 'Liability',
      'content': 'We are not liable for any damages, including but not limited to, loss of data, profits, or business interruption, arising from the use or inability to use the app.',
    },
    {
      'title': 'Refunds',
      'content': 'Refunds are not provided for subscription fees. Users may cancel their subscription at any time, but no refunds will be issued for the remaining subscription period.',
    },
    {
      'title': 'Third Party Services',
      'content': 'The app may utilize third-party services for various functionalities. Users are subject to the terms and conditions of these third-party services when using the app.',
    },
    {
      'title': 'Data Security',
      'content': 'We prioritize the security of user data and employ measures to safeguard it. However, we cannot guarantee absolute security and are not liable for any unauthorized access or breaches.',
    },
    {
      'title': 'Termination of Services',
      'content': 'We reserve the right to terminate or suspend services at any time, without prior notice or liability, for any reason, including but not limited to, violation of terms.',
    },
    {
      'title': 'Governing Law',
      'content': 'These terms and conditions are governed by and construed in accordance with the laws of [Your Country]. Any disputes arising from these terms shall be resolved in the courts of [Your Jurisdiction].',
    },
    {
      'title': 'Changes to Terms & Conditions',
      'content': 'We reserve the right to modify or replace these terms and conditions at any time. Users will be notified of any changes, and continued use of the app constitutes acceptance of the modified terms.',
    },
    {
      'title': 'Acceptance of Terms',
      'content': 'By using this app, you acknowledge that you have read, understood, and agree to be bound by these terms and conditions. If you do not agree with any part of these terms, you may not use the app.',
    },
  ];

  static List<String> interestList = [
    'Income',
    'Expense',
  ];

  static List<String> repeatingList = [
    'Daily',
    'Weekly',
    'Bi-Weekly',
    'Monthly',
    'Yearly',
  ];

  static List<String> reminderList = [
    '1 Day Before',
    '3 Days Before',
    '7 Days Before',
  ];

  static List<String> dateComponents = [
    'Day',
    'Month',
    'Year',
  ];

  static String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
