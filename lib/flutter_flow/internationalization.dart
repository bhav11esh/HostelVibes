import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'kn'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? knText = '',
  }) =>
      [enText, hiText, knText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'fe08fri0': {
      'en':
          'Travel App for Backpackers,\nDigital Nomads,\nSolo Travellers and \nWorkstation ',
      'hi': '',
      'kn': '',
    },
    's0lo3z8k': {
      'en': 'Email Address',
      'hi': '',
      'kn': '',
    },
    'zxy4c4cn': {
      'en': 'Enter your email here...',
      'hi': '',
      'kn': '',
    },
    'ezfih4a8': {
      'en': 'Password',
      'hi': '',
      'kn': '',
    },
    '4jotp0he': {
      'en': 'Enter your email here...',
      'hi': '',
      'kn': '',
    },
    'c7imjmnm': {
      'en': 'Login',
      'hi': '',
      'kn': '',
    },
    'x64i1vcz': {
      'en': 'Forgot Password?',
      'hi': '',
      'kn': '',
    },
    '5texqboj': {
      'en': 'Or',
      'hi': '',
      'kn': '',
    },
    'vybvk34c': {
      'en': 'Phone',
      'hi': '',
      'kn': '',
    },
    '6wugmba4': {
      'en': 'Google',
      'hi': '',
      'kn': '',
    },
    'c47znkos': {
      'en': 'Don\'t have an account?',
      'hi': '',
      'kn': '',
    },
    '9574tqm4': {
      'en': 'Register here',
      'hi': '',
      'kn': '',
    },
    'jsn3solm': {
      'en': 'Travel App for Backpackers,\nDigital Nomads,\nand Workstation ',
      'hi': '',
      'kn': '',
    },
    '30uj8xrf': {
      'en': 'Email Address',
      'hi': '',
      'kn': '',
    },
    'ebp3f2xg': {
      'en': 'Enter your email here...',
      'hi': '',
      'kn': '',
    },
    'n3l3gstp': {
      'en': 'Password',
      'hi': '',
      'kn': '',
    },
    'kaxcjzvw': {
      'en': 'Enter your email here...',
      'hi': '',
      'kn': '',
    },
    '1v8lz38r': {
      'en': 'Login',
      'hi': '',
      'kn': '',
    },
    '0e28y7u9': {
      'en': 'Forgot Password?',
      'hi': '',
      'kn': '',
    },
    'ydimolcn': {
      'en': 'Or',
      'hi': '',
      'kn': '',
    },
    'e2vram5t': {
      'en': 'Phone',
      'hi': '',
      'kn': '',
    },
    'mrjc7j3k': {
      'en': 'Google',
      'hi': '',
      'kn': '',
    },
    'e3974a75': {
      'en': 'Don\'t have an account?',
      'hi': '',
      'kn': '',
    },
    'lj7p2yqq': {
      'en': 'Register here',
      'hi': '',
      'kn': '',
    },
    'e7f0dma2': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // changePassword
  {
    't2lnkr2n': {
      'en': 'Email Address',
      'hi': '',
      'kn': '',
    },
    'plut6vs7': {
      'en': 'Your email..',
      'hi': '',
      'kn': '',
    },
    'gyfm1yj0': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account above.',
      'hi': '',
      'kn': '',
    },
    't2tfgfls': {
      'en': 'Send Reset Link',
      'hi': '',
      'kn': '',
    },
    'jd198tes': {
      'en': 'Change Password',
      'hi': '',
      'kn': '',
    },
    'w54evyxc': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // createAccount
  {
    'kjkk7d1x': {
      'en': ' Hostel Search',
      'hi': '',
      'kn': '',
    },
    'xrar375t': {
      'en': 'Get Started Below,',
      'hi': '',
      'kn': '',
    },
    'h270hy2h': {
      'en': 'Email Address',
      'hi': '',
      'kn': '',
    },
    'uipuuhdg': {
      'en': 'Enter your email here...',
      'hi': '',
      'kn': '',
    },
    'cydefcpm': {
      'en': 'Password',
      'hi': '',
      'kn': '',
    },
    'gjqechik': {
      'en': 'Enter your email here...',
      'hi': '',
      'kn': '',
    },
    'vqibgr3c': {
      'en': 'Create Account',
      'hi': '',
      'kn': '',
    },
    'vb006hc9': {
      'en': 'Already have an account?',
      'hi': '',
      'kn': '',
    },
    'o9zc9olc': {
      'en': 'Login',
      'hi': '',
      'kn': '',
    },
    'f9qsuvq5': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // SearchFilters
  {
    'xj9bwka0': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
    '96mis4f6': {
      'en': 'Find destinations...',
      'hi': '',
      'kn': '',
    },
    'jino6ajr': {
      'en': 'Beach, mountains, long strolls...',
      'hi': '',
      'kn': '',
    },
    '5iry0xwg': {
      'en': 'Clear all',
      'hi': '',
      'kn': '',
    },
    'p9xrhtwk': {
      'en': 'Search ',
      'hi': '',
      'kn': '',
    },
    'y30g058r': {
      'en': 'When\'s Your trip ?',
      'hi': '',
      'kn': '',
    },
    '92wjyibx': {
      'en': 'Guests :',
      'hi': '',
      'kn': '',
    },
    'c2s7d1zr': {
      'en': 'Shop',
      'hi': '',
      'kn': '',
    },
  },
  // searchProperties
  {
    '9rbkfvkz': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    't35fyoho': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // propertyReview
  {
    '9lfsczcv': {
      'en': 'Reviews',
      'hi': '',
      'kn': '',
    },
    '524emy2y': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // bookNowPage
  {
    '5oaq5pdb': {
      'en': 'Book Now',
      'hi': '',
      'kn': '',
    },
    '4ek146tk': {
      'en': 'Choose Dates',
      'hi': '',
      'kn': '',
    },
    'dbzkwcw2': {
      'en': 'Base Price',
      'hi': '',
      'kn': '',
    },
    'otvjm0p2': {
      'en': 'Taxes',
      'hi': '',
      'kn': '',
    },
    'uangb8yq': {
      'en': '0%',
      'hi': '',
      'kn': '',
    },
    'qxve35mg': {
      'en': 'Service Fee',
      'hi': '',
      'kn': '',
    },
    'j11u29hm': {
      'en': '0% ',
      'hi': '',
      'kn': '',
    },
    'yc552tdz': {
      'en': 'Total',
      'hi': '',
      'kn': '',
    },
    '2bcoiuzo': {
      'en': 'Terms and Conditions',
      'hi': '',
      'kn': '',
    },
    'pimn588v': {
      'en': 'Reserve Now',
      'hi': '',
      'kn': '',
    },
    'vhqfx51r': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // propertyDetails
  {
    'ss33h5cy': {
      'en': 'DISCRIPTION',
      'hi': '',
      'kn': '',
    },
    'srz7wb7r': {
      'en': 'Facilities',
      'hi': '',
      'kn': '',
    },
    'zi5ayrqm': {
      'en': 'What people are saying',
      'hi': '',
      'kn': '',
    },
    '5uwbn6wm': {
      'en': 'Josh Richardson',
      'hi': '',
      'kn': '',
    },
    'fxq55jnq': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
      'hi': '',
      'kn': '',
    },
    '51plls1a': {
      'en': 'Josh Richardson',
      'hi': '',
      'kn': '',
    },
    '0sfepxib': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
      'hi': '',
      'kn': '',
    },
    'w346vhre': {
      'en': 'per night',
      'hi': '',
      'kn': '',
    },
    'g8sl49tz': {
      'en': 'Select room',
      'hi': '',
      'kn': '',
    },
    'm4p78o8t': {
      'en': 'per night',
      'hi': '',
      'kn': '',
    },
    '98qrkmx3': {
      'en': 'Book',
      'hi': '',
      'kn': '',
    },
    '8yrrxllw': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // paymentInfo
  {
    '79crxl1b': {
      'en': 'Save Changes',
      'hi': '',
      'kn': '',
    },
    'kdck7bn8': {
      'en': 'Payment Information',
      'hi': '',
      'kn': '',
    },
    'bf4bmjqk': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // myTrips
  {
    'c2cty9dr': {
      'en': 'Upcoming',
      'hi': '',
      'kn': '',
    },
    '173zfvxx': {
      'en': ' - ',
      'hi': '',
      'kn': '',
    },
    'mam117m7': {
      'en': 'Join Hostel Community Chat',
      'hi': '',
      'kn': '',
    },
    'yeuljbf8': {
      'en': 'Completed',
      'hi': '',
      'kn': '',
    },
    'fqmeujdf': {
      'en': 'Cancelled',
      'hi': '',
      'kn': '',
    },
    'dwj2fpy1': {
      'en': ' - ',
      'hi': '',
      'kn': '',
    },
    'd8swu0kq': {
      'en': 'Rate Trip',
      'hi': '',
      'kn': '',
    },
    's15ohggk': {
      'en': 'My Trips',
      'hi': '',
      'kn': '',
    },
    '28anghuy': {
      'en': '',
      'hi': '',
      'kn': '',
    },
  },
  // tripDetails
  {
    'w71debsm': {
      'en': 'Trip Details',
      'hi': '',
      'kn': '',
    },
    'po3j1t1a': {
      'en': 'Dates of trip',
      'hi': '',
      'kn': '',
    },
    'p09og229': {
      'en': ' - ',
      'hi': '',
      'kn': '',
    },
    'hexiu1z7': {
      'en': 'Destination',
      'hi': '',
      'kn': '',
    },
    'hmulw7gw': {
      'en': 'Price Breakdown',
      'hi': '',
      'kn': '',
    },
    'q89zpmdv': {
      'en': 'Num of Nights ',
      'hi': '',
      'kn': '',
    },
    'j4mgxuva': {
      'en': 'Base Price',
      'hi': '',
      'kn': '',
    },
    '4mte2zkc': {
      'en': 'Taxes',
      'hi': '',
      'kn': '',
    },
    'wp668aqh': {
      'en': '0',
      'hi': '',
      'kn': '',
    },
    'ixfiw5l0': {
      'en': 'Service Fee',
      'hi': '',
      'kn': '',
    },
    'jpo7ajj2': {
      'en': '0',
      'hi': '',
      'kn': '',
    },
    'a8jy3wfq': {
      'en': 'Total',
      'hi': '',
      'kn': '',
    },
    '4s0jyfw0': {
      'en': 'Review Trip',
      'hi': '',
      'kn': '',
    },
    'qeyuitho': {
      'en': 'Host Info',
      'hi': '',
      'kn': '',
    },
    'ighch9n9': {
      'en': 'Chat',
      'hi': '',
      'kn': '',
    },
    'j0tv7tvg': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // myBookings
  {
    'utrdw4b3': {
      'en': 'Upcoming ',
      'hi': '',
      'kn': '',
    },
    'm5sd55gw': {
      'en': ' - ',
      'hi': '',
      'kn': '',
    },
    'ecdpe9e4': {
      'en': 'Total',
      'hi': '',
      'kn': '',
    },
    'mwv8e0mv': {
      'en': 'Completed',
      'hi': '',
      'kn': '',
    },
    'd75i59r8': {
      'en': ' - ',
      'hi': '',
      'kn': '',
    },
    '6vspyqxl': {
      'en': 'Total',
      'hi': '',
      'kn': '',
    },
    'py09ktel': {
      'en': 'My Bookings',
      'hi': '',
      'kn': '',
    },
    'aqgakfxh': {
      'en': 'My Trips',
      'hi': '',
      'kn': '',
    },
  },
  // profilePage
  {
    'jg7mnhb2': {
      'en': 'Interest : ',
      'hi': '',
      'kn': '',
    },
    '2fl06fbp': {
      'en': 'Option 1',
      'hi': '',
      'kn': '',
    },
    'm3jswcnh': {
      'en': 'Switch to Dark Mode',
      'hi': '',
      'kn': '',
    },
    '0358updb': {
      'en': 'Switch to Light Mode',
      'hi': '',
      'kn': '',
    },
    'x2iv0ec3': {
      'en': 'Account Details',
      'hi': '',
      'kn': '',
    },
    '9xbmqvij': {
      'en': 'Letters from Friends',
      'hi': '',
      'kn': '',
    },
    'rq4mjfq5': {
      'en': 'Edit Profile',
      'hi': '',
      'kn': '',
    },
    '6bicqgri': {
      'en': 'Change Password',
      'hi': '',
      'kn': '',
    },
    'micp698x': {
      'en': 'My Bookings',
      'hi': '',
      'kn': '',
    },
    'dtg3cwpr': {
      'en': 'Help',
      'hi': '',
      'kn': '',
    },
    'lg9lai92': {
      'en': 'Log Out',
      'hi': '',
      'kn': '',
    },
    'jcziytql': {
      'en': '',
      'hi': '',
      'kn': '',
    },
  },
  // editProfile
  {
    '1cva2dmc': {
      'en': 'My Profile',
      'hi': '',
      'kn': '',
    },
    'piraral3': {
      'en': 'Change Photo',
      'hi': '',
      'kn': '',
    },
    'd89j9t26': {
      'en': 'Full Name',
      'hi': '',
      'kn': '',
    },
    'gz4ltw22': {
      'en': 'Your full name...',
      'hi': '',
      'kn': '',
    },
    'iet2pzko': {
      'en': 'Your social media link so others can find you',
      'hi': '',
      'kn': '',
    },
    'bu2xqryz': {
      'en': 'Your Instagram/ Snapchat/Youtube...',
      'hi': '',
      'kn': '',
    },
    '7zo5hemy': {
      'en': 'Email Address',
      'hi': '',
      'kn': '',
    },
    't786s3m7': {
      'en': 'Your email..',
      'hi': '',
      'kn': '',
    },
    'q6vxa46j': {
      'en': 'Phone Number',
      'hi': '',
      'kn': '',
    },
    'pzc38gj6': {
      'en': 'Your Number..',
      'hi': '',
      'kn': '',
    },
    'x4fog0gj': {
      'en': 'City / Country',
      'hi': '',
      'kn': '',
    },
    'pdkti6dv': {
      'en': 'Nationality',
      'hi': '',
      'kn': '',
    },
    'zt4jtjw2': {
      'en': 'Status',
      'hi': '',
      'kn': '',
    },
    'gqda7b9n': {
      'en': 'A little about you...',
      'hi': '',
      'kn': '',
    },
    '3favxj66': {
      'en': 'Select what best describes you.....',
      'hi': '',
      'kn': '',
    },
    'k5p02d47': {
      'en': 'Option 1',
      'hi': '',
      'kn': '',
    },
    'dmatsvdj': {
      'en': 'Upload ID  ',
      'hi': '',
      'kn': '',
    },
    'yuvhfy0w': {
      'en': '* For Smart Checkin at Hostel',
      'hi': '',
      'kn': '',
    },
    '5rki7y8b': {
      'en': 'Save Changes',
      'hi': '',
      'kn': '',
    },
    '0bdwl984': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // chatMain
  {
    'qwxqxw11': {
      'en': 'Meet Other Travellers !',
      'hi': '',
      'kn': '',
    },
    '2nh503t2': {
      'en': 'groupchat button',
      'hi': '',
      'kn': '',
    },
    'jkwnl0ln': {
      'en': '',
      'hi': '',
      'kn': '',
    },
  },
  // chatDetails
  {
    '1sxr33fq': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // AddChatUsersPage
  {
    'ahr7037a': {
      'en': 'Add Friends to chat',
      'hi': '',
      'kn': '',
    },
    'rjqajwg2': {
      'en': 'Select the friends to add to chat.',
      'hi': '',
      'kn': '',
    },
    'vjyrhte2': {
      'en': 'Search the Person by name...',
      'hi': '',
      'kn': '',
    },
    '0llx7ckz': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '7xu8hsot': {
      'en': 'Option 1',
      'hi': '',
      'kn': '',
    },
  },
  // Mainpage
  {
    'vdzlobgp': {
      'en': 'Enter destinations...',
      'hi': '',
      'kn': '',
    },
    'h4wa1xnc': {
      'en': 'Wayanda, Ooty, Bangalore',
      'hi': '',
      'kn': '',
    },
    'of6bf6w5': {
      'en': 'Explore Best Backpacking hostels to travel ...',
      'hi': '',
      'kn': '',
    },
    'qm3q4kk1': {
      'en': 'Try: Plan Your trip with ChatGPT',
      'hi': '',
      'kn': '',
    },
    '0bsudgn2': {
      'en': 'Experience top destinations',
      'hi': '',
      'kn': '',
    },
    'udoacbe9': {
      'en': '30 locations world wide',
      'hi': '',
      'kn': '',
    },
    'l2rqmf5p': {
      'en': 'Per Night ',
      'hi': '',
      'kn': '',
    },
    'yrj8pb5p': {
      'en': 'Relaxing Places',
      'hi': '',
      'kn': '',
    },
    '975p5wjp': {
      'en': '10 spots to catch some zzz\'s',
      'hi': '',
      'kn': '',
    },
    'voz8fz0c': {
      'en': 'Per Night Stay',
      'hi': '',
      'kn': '',
    },
  },
  // chatgpt
  {
    '6fk6m33w': {
      'en': 'Copy response',
      'hi': '',
      'kn': '',
    },
    'akg3honr': {
      'en': 'Type something...',
      'hi': '',
      'kn': '',
    },
    'v8j5zr5n': {
      'en': 'TravelGPT: OpenAI',
      'hi': '',
      'kn': '',
    },
    '0mwuczr9': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // FIlters_for_hostel
  {
    '3yphy4j3': {
      'en': 'Property Type',
      'hi': '',
      'kn': '',
    },
    'fv8auix1': {
      'en': 'All',
      'hi': '',
      'kn': '',
    },
    '7s0iqhw7': {
      'en': 'Party',
      'hi': '',
      'kn': '',
    },
    'wgew1r1j': {
      'en': 'Work',
      'hi': '',
      'kn': '',
    },
    'xvtxxf26': {
      'en': 'Peaceful',
      'hi': '',
      'kn': '',
    },
    'pen6es97': {
      'en': 'Camping',
      'hi': '',
      'kn': '',
    },
    'x5lcthtp': {
      'en': 'Flexible  Booking',
      'hi': '',
      'kn': '',
    },
    'wit5lu26': {
      'en': 'All',
      'hi': '',
      'kn': '',
    },
    'mxl6ux4y': {
      'en': 'Average Price Per Night',
      'hi': '',
      'kn': '',
    },
    'ysfz4ch8': {
      'en': 'Room',
      'hi': '',
      'kn': '',
    },
    '8t2v69xv': {
      'en': 'All',
      'hi': '',
      'kn': '',
    },
    'qfym40ep': {
      'en': 'Female Dorm',
      'hi': '',
      'kn': '',
    },
    'l825s2wu': {
      'en': 'Male Dorm',
      'hi': '',
      'kn': '',
    },
    'taif7mxg': {
      'en': 'Mix Dorm',
      'hi': '',
      'kn': '',
    },
    'u9d09hy5': {
      'en': 'All',
      'hi': '',
      'kn': '',
    },
    'iqw23muy': {
      'en': 'All',
      'hi': '',
      'kn': '',
    },
    'g6393qpd': {
      'en': 'SIngle Room',
      'hi': '',
      'kn': '',
    },
    '30fpfdvz': {
      'en': 'Double Room',
      'hi': '',
      'kn': '',
    },
    'v893tv3s': {
      'en': 'Triple Room',
      'hi': '',
      'kn': '',
    },
    'odvlcw4b': {
      'en': 'All',
      'hi': '',
      'kn': '',
    },
    'yzmeeovn': {
      'en': 'Hello World',
      'hi': '',
      'kn': '',
    },
    '2v1l9uhz': {
      'en': 'Rating',
      'hi': '',
      'kn': '',
    },
    '2g7iwou9': {
      'en': 'Facilities',
      'hi': '',
      'kn': '',
    },
    'pn5lrv0y': {
      'en': 'Free Wifi',
      'hi': '',
      'kn': '',
    },
    '12wdq3r2': {
      'en': 'Kitchen',
      'hi': '',
      'kn': '',
    },
    'dwqziz0j': {
      'en': 'AC',
      'hi': '',
      'kn': '',
    },
    'earjo1vz': {
      'en': 'Swimming Pool',
      'hi': '',
      'kn': '',
    },
    'v1bwdryo': {
      'en': 'Vechicle',
      'hi': '',
      'kn': '',
    },
    'rx1kcuez': {
      'en': 'Games',
      'hi': '',
      'kn': '',
    },
    '2zveeb5l': {
      'en': 'Free Wifi',
      'hi': '',
      'kn': '',
    },
    '9tbi8ay5': {
      'en': 'Apply',
      'hi': '',
      'kn': '',
    },
    'wjfvwvav': {
      'en': 'Filters ',
      'hi': '',
      'kn': '',
    },
    '4yi8p71w': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // Diary
  {
    'yd810j3t': {
      'en': 'Inbox',
      'hi': '',
      'kn': '',
    },
    'sibre7y1': {
      'en': 'Diary',
      'hi': '',
      'kn': '',
    },
  },
  // Onboarding2
  {
    'i3edr555': {
      'en': 'Travel in best hostels',
      'hi': '',
      'kn': '',
    },
    'zd3cwe8o': {
      'en':
          'Travelling  made super easy & fun\nCompare backpacking hostels vibe',
      'hi': '',
      'kn': '',
    },
    '0h063wfa': {
      'en': 'Compare Prices  & Book',
      'hi': '',
      'kn': '',
    },
    'xny28fug': {
      'en':
          'Booking.com, Hostelworld, MakeMyTrip, Priceline ...compare all in 1',
      'hi': '',
      'kn': '',
    },
    '01dauxev': {
      'en': 'Meet Other Travellers',
      'hi': '',
      'kn': '',
    },
    '75jhlswr': {
      'en':
          'Make new friends along the way or connect with locals for bike, food, services ',
      'hi': '',
      'kn': '',
    },
    'aicxkjin': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
    'xjla4la2': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // onclickconnections
  {
    'bovuj594': {
      'en': 'meet your <crazy> hostel-mates',
      'hi': '',
      'kn': '',
    },
  },
  // FriendBio
  {
    '27nkozme': {
      'en': 'Option 1',
      'hi': '',
      'kn': '',
    },
    'fh5p89oo': {
      'en': 'Status: ',
      'hi': '',
      'kn': '',
    },
    't9p50qf1': {
      'en': 'Send a letter to your friend',
      'hi': '',
      'kn': '',
    },
    '1gpmdjb9': {
      'en': 'Only he/she can see. this on his travel diary',
      'hi': '',
      'kn': '',
    },
    'vqtmg8mf': {
      'en': 'Submit',
      'hi': '',
      'kn': '',
    },
    'nl9dahdw': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // Phonesignin
  {
    'zh8u9355': {
      'en': 'Back',
      'hi': '',
      'kn': '',
    },
    'k4ljmtie': {
      'en':
          'Enter your Phone Number. We will send an SMS vertification code to this number',
      'hi': '',
      'kn': '',
    },
    'mnkdhila': {
      'en': '+91  ',
      'hi': '',
      'kn': '',
    },
    'e33zzrgj': {
      'en': 'Your Phone Number',
      'hi': '',
      'kn': '',
    },
    'h76usfu9': {
      'en': 'Enter 10 digit Phone number',
      'hi': '',
      'kn': '',
    },
    'j7l4jv4q': {
      'en': 'Send OTP',
      'hi': '',
      'kn': '',
    },
    'zug65nbg': {
      'en': 'Phone Sign In',
      'hi': '',
      'kn': '',
    },
    '04ced19f': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // PhoneOTP
  {
    'okzgdmli': {
      'en': 'Back',
      'hi': '',
      'kn': '',
    },
    '4w92z449': {
      'en':
          'We have sent a six digit code to your phone number. Please verify your phone number by entering this code below:',
      'hi': '',
      'kn': '',
    },
    's2gga8hg': {
      'en': 'Submit',
      'hi': '',
      'kn': '',
    },
    'iiw4enoj': {
      'en': 'Didn\'t receive OTP?  Send OTP again ',
      'hi': '',
      'kn': '',
    },
    '9323uxnq': {
      'en': 'Verify SMS Code',
      'hi': '',
      'kn': '',
    },
    'kium4xdb': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // chat_2_Details
  {
    'kzrin4q7': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // chat_2_main
  {
    'da02grt2': {
      'en': 'My Chats',
      'hi': '',
      'kn': '',
    },
    '2fu6xz21': {
      'en': '',
      'hi': '',
      'kn': '',
    },
  },
  // chat_2_InviteUsers
  {
    'wzvv7twy': {
      'en': '_ Search the Person by name...',
      'hi': '',
      'kn': '',
    },
    '03rwel2c': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'uau5t5b6': {
      'en': 'Invite Friends',
      'hi': '',
      'kn': '',
    },
    '6yjbfnnd': {
      'en': 'Selected',
      'hi': '',
      'kn': '',
    },
    'mab6hsks': {
      'en': 'Invite Friends',
      'hi': '',
      'kn': '',
    },
    'jwq40bjf': {
      'en': 'Select users from below to start a chat.',
      'hi': '',
      'kn': '',
    },
    '46ud926u': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // image_Details
  {
    '5j78yero': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // chat_2_InviteUsersCopy
  {
    'z2g311y3': {
      'en': 'Invite Friends',
      'hi': '',
      'kn': '',
    },
    '3qmnr32f': {
      'en': 'Selected',
      'hi': '',
      'kn': '',
    },
    'amxgmiax': {
      'en': 'Invite Friends from Hostel',
      'hi': '',
      'kn': '',
    },
    'r0ssjt1p': {
      'en': 'Select users from below to start a chat.',
      'hi': '',
      'kn': '',
    },
    'mtn4nlpa': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // bottomSheet
  {
    '16y4z752': {
      'en': 'Session Booked!',
      'hi': '',
      'kn': '',
    },
    '9xdtm109': {
      'en': 'You have successfully booked a session on:',
      'hi': '',
      'kn': '',
    },
    'bnzg2gm3': {
      'en': 'Mon, Dec 11 - 2021',
      'hi': '',
      'kn': '',
    },
  },
  // total
  {
    'l8j8qh8p': {
      'en': 'Booking Breakdown',
      'hi': '',
      'kn': '',
    },
    'r5pmiwfu': {
      'en': ' Rs ',
      'hi': '',
      'kn': '',
    },
    'xvzehkg5': {
      'en': 'Okay',
      'hi': '',
      'kn': '',
    },
  },
  // changePhoto
  {
    '11f4cp5m': {
      'en': 'Change Profile Photo',
      'hi': '',
      'kn': '',
    },
    'mfkh03qp': {
      'en': 'Upload Photo',
      'hi': '',
      'kn': '',
    },
    'b9nzlpbh': {
      'en': 'Save Photo',
      'hi': '',
      'kn': '',
    },
  },
  // reviewTrip
  {
    'sl8kijmg': {
      'en': 'Rate Your Trip',
      'hi': '',
      'kn': '',
    },
    'xvxpgqde': {
      'en': 'Let us know what you thought of the place below!',
      'hi': '',
      'kn': '',
    },
    'yqub7h46': {
      'en': 'How would you rate it?',
      'hi': '',
      'kn': '',
    },
    'y0rz6cc9': {
      'en': 'Please leave a description of the place...',
      'hi': '',
      'kn': '',
    },
    'a0b620oj': {
      'en': 'Submit Review',
      'hi': '',
      'kn': '',
    },
  },
  // cancelTrip
  {
    'nl4994po': {
      'en': 'Cancel Trip',
      'hi': '',
      'kn': '',
    },
    'fi3zyxi2': {
      'en':
          'If you want to cancel your tripl please leave a note below to send to the host.',
      'hi': '',
      'kn': '',
    },
    '247i68ke': {
      'en': 'Your reason for cancelling...',
      'hi': '',
      'kn': '',
    },
    'kc39irca': {
      'en': 'Yes, Cancel Trip',
      'hi': '',
      'kn': '',
    },
    'dga3nrh7': {
      'en': 'Never Mind',
      'hi': '',
      'kn': '',
    },
  },
  // cancelTripHOST
  {
    'z319h0jg': {
      'en': 'Cancel Trip',
      'hi': '',
      'kn': '',
    },
    '6ulpzb93': {
      'en':
          'If you want to cancel your tripl please leave a note below to send to the host.',
      'hi': '',
      'kn': '',
    },
    'm1733o3n': {
      'en': 'Your reason for cancelling...',
      'hi': '',
      'kn': '',
    },
    'kb1226ri': {
      'en': 'Yes, Cancel Trip',
      'hi': '',
      'kn': '',
    },
    'xrpyo03v': {
      'en': 'Never Mind',
      'hi': '',
      'kn': '',
    },
  },
  // CardTravel
  {
    'scpzbwfc': {
      'en': 'Cinque Terre',
      'hi': '',
      'kn': '',
    },
    'efp66k0c': {
      'en': '4.7',
      'hi': '',
      'kn': '',
    },
    'yjnr4vrw': {
      'en': '\$220 USD',
      'hi': '',
      'kn': '',
    },
  },
  // usersmm
  {
    'gqoefeao': {
      'en': 'Username',
      'hi': '',
      'kn': '',
    },
    'uu033hat': {
      'en': '4:00pm',
      'hi': '',
      'kn': '',
    },
    'bm5exw97': {
      'en': 'Secondary text',
      'hi': '',
      'kn': '',
    },
  },
  // ChatgptDis
  {
    'ydb55h49': {
      'en':
          'You can build a Travel Itinary with ChatGPT x our Travel information in a matter of minutes 🤯\nTry out planning by typing a response below : \n\n\" Plan me a 2 day  trip with budget for  Ooty \"🎉\n',
      'hi': '',
      'kn': '',
    },
  },
  // Dorms
  {
    'uzdkvi0a': {
      'en': ' Person',
      'hi': '',
      'kn': '',
    },
    'ii3y6gr3': {
      'en': 'Standard',
      'hi': '',
      'kn': '',
    },
    'q6kwe8zg': {
      'en': '*Average Prices per night per bed',
      'hi': '',
      'kn': '',
    },
  },
  // reviewTripCopy
  {
    'tb8l7uy5': {
      'en': 'To: Bhavesh',
      'hi': '',
      'kn': '',
    },
    'lm0f7hg8': {
      'en': 'Hello World',
      'hi': '',
      'kn': '',
    },
    'cntr7739': {
      'en': 'Write something about your friend until you next meetup!',
      'hi': '',
      'kn': '',
    },
    'dx39p0b2': {
      'en': 'Write something about your friend',
      'hi': '',
      'kn': '',
    },
    'rilex3m7': {
      'en': 'Insert  ',
      'hi': '',
      'kn': '',
    },
    'umlvymio': {
      'en': 'Submit Review',
      'hi': '',
      'kn': '',
    },
  },
  // Saveuserdetails
  {
    'cwdhoy6y': {
      'en': 'Name',
      'hi': '',
      'kn': '',
    },
    'h1chdysz': {
      'en': 'Email',
      'hi': '',
      'kn': '',
    },
    '457ert4h': {
      'en': 'Age',
      'hi': '',
      'kn': '',
    },
    't9m9uuem': {
      'en': 'Contact Number',
      'hi': '',
      'kn': '',
    },
    'hw32qfxo': {
      'en': 'Save ',
      'hi': '',
      'kn': '',
    },
  },
  // HostelCardInfo
  {
    'tfo97mb1': {
      'en': ' from City Center',
      'hi': '',
      'kn': '',
    },
    '9p974yd5': {
      'en': 'facilities:',
      'hi': '',
      'kn': '',
    },
    '2v50quwc': {
      'en': 'Private',
      'hi': '',
      'kn': '',
    },
    '9rlf7hlx': {
      'en': 'Starts at',
      'hi': '',
      'kn': '',
    },
    'skjx2z2v': {
      'en': 'Dorm',
      'hi': '',
      'kn': '',
    },
    'gnodorin': {
      'en': 'Starts at',
      'hi': '',
      'kn': '',
    },
  },
  // chat_DetailsOverlay
  {
    'zrxw19zs': {
      'en': 'Group Name :',
      'hi': '',
      'kn': '',
    },
    'vff28fkd': {
      'en': 'In this chat',
      'hi': '',
      'kn': '',
    },
    'znf30na5': {
      'en': 'Leave the Chat permanently',
      'hi': '',
      'kn': '',
    },
    'zzc96usv': {
      'en': 'Close',
      'hi': '',
      'kn': '',
    },
  },
  // chat_ThreadComponent
  {
    'lpiahqf6': {
      'en': 'Start typing here...',
      'hi': '',
      'kn': '',
    },
    'czz01nkp': {
      'en': 'You must enter a message...',
      'hi': '',
      'kn': '',
    },
    'yt975hnq': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'kn': '',
    },
    'myqaf119': {
      'en': 'Join',
      'hi': '',
      'kn': '',
    },
  },
  // user_ListSmall
  {
    '57l29fna': {
      'en': 'ME',
      'hi': '',
      'kn': '',
    },
  },
  // deleteDialog
  {
    '40wtyjgw': {
      'en': 'Options',
      'hi': '',
      'kn': '',
    },
    'z4013oc5': {
      'en': 'Invite Users',
      'hi': '',
      'kn': '',
    },
    'laha0dqv': {
      'en': 'Delete Chat',
      'hi': '',
      'kn': '',
    },
    'f8l19hx8': {
      'en': 'Confirm Delete',
      'hi': '',
      'kn': '',
    },
    '45ofynmf': {
      'en': 'You can\'t undo this action.',
      'hi': '',
      'kn': '',
    },
    'j090omma': {
      'en': 'Delete',
      'hi': '',
      'kn': '',
    },
  },
  // GroupName
  {
    'yi03gbmi': {
      'en': 'Group Name',
      'hi': '',
      'kn': '',
    },
    '8j78fvy3': {
      'en': 'What\'s your Group Name',
      'hi': '',
      'kn': '',
    },
    'vbf8y916': {
      'en': 'Night party / Bangalore Eaters...',
      'hi': '',
      'kn': '',
    },
    'ab6rsdih': {
      'en': 'Save ',
      'hi': '',
      'kn': '',
    },
  },
  // TnC
  {
    'f7wya38m': {
      'en': 'Terms and Conditions',
      'hi': '',
      'kn': '',
    },
    'nho1uzm7': {
      'en':
          'Price Variability and Reimbursement Policy\nThe booking price may vary, and we strive to secure your booking at the displayed price. In the event of a cancellation, we are not liable for any reimbursement. However, we will facilitate the reimbursement process if the hostel agrees to refund the amount.\n\nHostel Cancellation Policy\nIf the hostel bans or cancels your booking, the booking amount will be refunded to your original payment method.\n\nBooking Failure Policy\nIn the event of a booking failure, the payment will be returned to your original payment method',
      'hi': '',
      'kn': '',
    },
    'apg5gaps': {
      'en': 'Okay',
      'hi': '',
      'kn': '',
    },
  },
  // AppVersionNotify
  {
    '4jnrqw8f': {
      'en': 'Your app is outdated !',
      'hi': '',
      'kn': '',
    },
    '48978haa': {
      'en':
          'Your app version is no longer supported. You are missing out on new features and critical fixes. Please update today.',
      'hi': '',
      'kn': '',
    },
    '9a3mv6zb': {
      'en': 'Update (Google Playstore)',
      'hi': '',
      'kn': '',
    },
    'xtl5dqfa': {
      'en': 'Update (Apple Appstore)',
      'hi': '',
      'kn': '',
    },
  },
  // Miscellaneous
  {
    'n9lmmoaw': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'nenhidha': {
      'en':
          'In Order toshar eyour pictures  this app requires permission to access the Library',
      'hi': '',
      'kn': '',
    },
    '7y8swaim': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    't7bz5xiu': {
      'en':
          'In Order to know your messages this app requires permission to access the notification',
      'hi': '',
      'kn': '',
    },
    'xgpzbg8l': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'bbwgow8k': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'bh48xfh7': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'hdbv85dw': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'ysmrbyhy': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '3fc90c8c': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'zt4gacmm': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'f9g34a6y': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'ruj1icy8': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'i4qq2vnd': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'sbq1h8nn': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'rkuxe9e1': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'femwsns6': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '3mu4yptd': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    't7y9cg6s': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '9mebqrpq': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '7h0n3dc0': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'k1r4oil6': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'c5j4ks1l': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'p4bamssz': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'sficmgro': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '7cl1rd1a': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'n1mg1ff9': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'ds5equum': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '7nrrt5mr': {
      'en': '',
      'hi': '',
      'kn': '',
    },
  },
].reduce((a, b) => a..addAll(b));
