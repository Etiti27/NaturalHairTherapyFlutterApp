import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailSend {
  final String? username = dotenv.env['EMAIL_USERNAME']; // Ensure this is set
  final String? password = dotenv.env['EMAIL_PASSWORD']; // Ensure this is set
  final String senderName = "Natural Hair Therapist";
  final String receipientEmail;
  final String emailSubject;
  final String emailText;

  EmailSend({
    required this.emailSubject,
    required this.emailText,
    required this.receipientEmail,
  });

  Future<void> sendEmailed() async {
    await dotenv.load();
    print(password);

    // Ensure dotenv is loaded
    if (username == null || password == null) {
      if (kDebugMode) {
        print("❌ ERROR: EMAIL_USERNAME or EMAIL_PASSWORD is not set in .env");
      }
      return;
    }

    final smtpServer = SmtpServer(
      "mail.naturalhairtherapist.com", // Use your actual SMTP host
      username: username,
      password: password, // Use App Password if needed
      port: 465, // Use 587 for TLS, 465 for SSL
      ssl: true,
      ignoreBadCertificate: true,
      // Disable SSL verification (FIX)// Enable SSL if using port 465
    );

    final message = Message()
      ..from =
          Address(username!, senderName) // 🔄 Ensure this matches `username`
      ..recipients.add(receipientEmail)
      ..subject = emailSubject
      ..html = emailText;

    try {
      final sendReport = await send(message, smtpServer);
      if (kDebugMode) {
        print("✅ Email sent successfully: ${sendReport.toString()}");
      }
    } catch (e) {
      if (kDebugMode) {
        print("❌ Failed to send email: $e");
      }
    }
  }
}
