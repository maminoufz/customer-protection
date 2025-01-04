// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign up`
  String get signup {
    return Intl.message(
      'Sign up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signin {
    return Intl.message(
      'Sign In',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `This field cannot be left empty`
  String get empty_error {
    return Intl.message(
      'This field cannot be left empty',
      name: 'empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get email_error {
    return Intl.message(
      'Please enter a valid email',
      name: 'email_error',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get password_mismatch {
    return Intl.message(
      'Passwords do not match',
      name: 'password_mismatch',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `titre`
  String get title {
    return Intl.message(
      'titre',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `prix`
  String get price {
    return Intl.message(
      'prix',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `descrption`
  String get description {
    return Intl.message(
      'descrption',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `PopularProducts`
  String get PopularProducts {
    return Intl.message(
      'PopularProducts',
      name: 'PopularProducts',
      desc: '',
      args: [],
    );
  }

  /// `See more`
  String get Seemore {
    return Intl.message(
      'See more',
      name: 'Seemore',
      desc: '',
      args: [],
    );
  }

  /// `Search product`
  String get Searchproduct {
    return Intl.message(
      'Search product',
      name: 'Searchproduct',
      desc: '',
      args: [],
    );
  }

  /// `Product not found`
  String get productNotFound {
    return Intl.message(
      'Product not found',
      name: 'productNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load product data`
  String get failedToLoad {
    return Intl.message(
      'Failed to load product data',
      name: 'failedToLoad',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get productDetails {
    return Intl.message(
      'Product Details',
      name: 'productDetails',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get errorMessage {
    return Intl.message(
      'An error occurred',
      name: 'errorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Product`
  String get unknownProduct {
    return Intl.message(
      'Unknown Product',
      name: 'unknownProduct',
      desc: '',
      args: [],
    );
  }

  /// `No image available`
  String get noImageAvailable {
    return Intl.message(
      'No image available',
      name: 'noImageAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Brand`
  String get brand {
    return Intl.message(
      'Brand',
      name: 'brand',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message(
      'Unknown',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `Nutritional Information`
  String get nutritionalInfo {
    return Intl.message(
      'Nutritional Information',
      name: 'nutritionalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Nutrient`
  String get nutrient {
    return Intl.message(
      'Nutrient',
      name: 'nutrient',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Energy`
  String get energy {
    return Intl.message(
      'Energy',
      name: 'energy',
      desc: '',
      args: [],
    );
  }

  /// `Fat`
  String get fat {
    return Intl.message(
      'Fat',
      name: 'fat',
      desc: '',
      args: [],
    );
  }

  /// `Saturated Fat`
  String get saturatedFat {
    return Intl.message(
      'Saturated Fat',
      name: 'saturatedFat',
      desc: '',
      args: [],
    );
  }

  /// `Carbohydrates`
  String get carbohydrates {
    return Intl.message(
      'Carbohydrates',
      name: 'carbohydrates',
      desc: '',
      args: [],
    );
  }

  /// `Sugars`
  String get sugars {
    return Intl.message(
      'Sugars',
      name: 'sugars',
      desc: '',
      args: [],
    );
  }

  /// `Proteins`
  String get proteins {
    return Intl.message(
      'Proteins',
      name: 'proteins',
      desc: '',
      args: [],
    );
  }

  /// `Salt`
  String get salt {
    return Intl.message(
      'Salt',
      name: 'salt',
      desc: '',
      args: [],
    );
  }

  /// `N/A`
  String get notAvailable {
    return Intl.message(
      'N/A',
      name: 'notAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Action successful!`
  String get successMessage {
    return Intl.message(
      'Action successful!',
      name: 'successMessage',
      desc: '',
      args: [],
    );
  }

  /// `Show Success Message`
  String get showSuccessMessage {
    return Intl.message(
      'Show Success Message',
      name: 'showSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `My Flutter App`
  String get appTitle {
    return Intl.message(
      'My Flutter App',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Scan with OCR`
  String get ocr {
    return Intl.message(
      'Scan with OCR',
      name: 'ocr',
      desc: '',
      args: [],
    );
  }

  /// `send message ..`
  String get chatmessage {
    return Intl.message(
      'send message ..',
      name: 'chatmessage',
      desc: '',
      args: [],
    );
  }

  /// `You`
  String get you {
    return Intl.message(
      'You',
      name: 'you',
      desc: '',
      args: [],
    );
  }

  /// `AI`
  String get ai {
    return Intl.message(
      'AI',
      name: 'ai',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get error {
    return Intl.message(
      'An error occurred',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Please try again`
  String get retry_error {
    return Intl.message(
      'Please try again',
      name: 'retry_error',
      desc: '',
      args: [],
    );
  }

  /// `Ai Food `
  String get chatScreenTitle {
    return Intl.message(
      'Ai Food ',
      name: 'chatScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Consumer protection With AI`
  String get ConsumerprotectionWithAI {
    return Intl.message(
      'Consumer protection With AI',
      name: 'ConsumerprotectionWithAI',
      desc: '',
      args: [],
    );
  }

  /// `We Are For You`
  String get Weareforyou {
    return Intl.message(
      'We Are For You',
      name: 'Weareforyou',
      desc: '',
      args: [],
    );
  }

  /// `messageerorrchat`
  String get messageerorrchat {
    return Intl.message(
      'messageerorrchat',
      name: 'messageerorrchat',
      desc: '',
      args: [],
    );
  }

  /// `Posting product...`
  String get postProduct {
    return Intl.message(
      'Posting product...',
      name: 'postProduct',
      desc: '',
      args: [],
    );
  }

  /// `Failed to post the product.`
  String get failedToPostProduct {
    return Intl.message(
      'Failed to post the product.',
      name: 'failedToPostProduct',
      desc: '',
      args: [],
    );
  }

  /// `Product posted successfully.`
  String get productPostedSuccessfully {
    return Intl.message(
      'Product posted successfully.',
      name: 'productPostedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `fileMessage`
  String get fileMessage {
    return Intl.message(
      'fileMessage',
      name: 'fileMessage',
      desc: '',
      args: [],
    );
  }

  /// `file_pick_error`
  String get file_pick_error {
    return Intl.message(
      'file_pick_error',
      name: 'file_pick_error',
      desc: '',
      args: [],
    );
  }

  /// `Nutritional Analysis`
  String get nutritionalAnalysis {
    return Intl.message(
      'Nutritional Analysis',
      name: 'nutritionalAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `Contains Gluten`
  String get containsGluten {
    return Intl.message(
      'Contains Gluten',
      name: 'containsGluten',
      desc: '',
      args: [],
    );
  }

  /// `Gluten Free`
  String get glutenFree {
    return Intl.message(
      'Gluten Free',
      name: 'glutenFree',
      desc: '',
      args: [],
    );
  }

  /// `High in Sugars`
  String get highSugars {
    return Intl.message(
      'High in Sugars',
      name: 'highSugars',
      desc: '',
      args: [],
    );
  }

  /// `Low in Sugars`
  String get lowSugars {
    return Intl.message(
      'Low in Sugars',
      name: 'lowSugars',
      desc: '',
      args: [],
    );
  }

  /// `highSugarWarning`
  String get highSugarWarning {
    return Intl.message(
      'highSugarWarning',
      name: 'highSugarWarning',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
