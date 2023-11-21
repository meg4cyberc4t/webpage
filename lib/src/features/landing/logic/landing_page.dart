import 'package:freezed_annotation/freezed_annotation.dart';

part 'landing_page.freezed.dart';

@freezed
class LandingPage with _$LandingPage {
  const factory LandingPage.opening({
    required final String title,
    required final String name,
    required final String workingPosition,
  }) = OpeningLandingPage;

  const factory LandingPage.aboutMe({
    required final String title,
    required final String body,
  }) = AboutMeLandingPage;

  const factory LandingPage.contacts({
    required final String title,
    required final List<ContactItem> contacts,
  }) = ContactsLandingPage;
}

class ContactItem {
  final String name;
  final String deeplinkName;
  final Uri? uri;

  const ContactItem({
    required this.name,
    required this.deeplinkName,
    required this.uri,
  });
}
