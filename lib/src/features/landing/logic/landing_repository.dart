import 'package:webpage/src/features/landing/logic/landing_page.dart';

final class LandingRepository {
  LandingRepository();

  List<LandingPage> getPages() => [
        const LandingPage.opening(
          title: 'Opening',
          name: 'Igor Molchanov',
          workingPosition: 'Middle+ Flutter Developer',
        ),
        const LandingPage.aboutMe(
          title: 'About Me',
          body: 'Hi, my name is Igor. '
              'I have been programming since 2019. I am fond of developing '
              'mobile applications and neural networks.\n'
              'For the last 3 years I have been actively engaged in '
              'multiplatform development on Flutter, libraries on Dart and '
              'actively support the open-source community.',
        ),
        LandingPage.contacts(
          title: 'Contacts',
          contacts: [
            ContactItem(
              name: 'Telegram',
              deeplinkName: '@molchanovia',
              uri: Uri.parse('https://t.me/molchanovia'),
            ),
            ContactItem(
              name: 'Github',
              deeplinkName: 'github.com/meg4cyberc4t',
              uri: Uri.parse('https://github.com/meg4cyberc4t'),
            ),
            ContactItem(
              name: 'Telegram channel',
              deeplinkName: 'Flutter Stable Channel',
              uri: Uri.parse('https://t.me/flutter_stable_channel'),
            ),
            const ContactItem(
              name: 'Discord',
              deeplinkName: 'molchanovia',
              uri: null,
            ),
          ],
        ),
      ];
}
