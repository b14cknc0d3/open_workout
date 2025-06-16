import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_my.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('my')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'OpenWorkOut'**
  String get appTitle;

  /// No description provided for @homeScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'My Workout Routines'**
  String get homeScreenTitle;

  /// No description provided for @noRoutinesMessage.
  ///
  /// In en, this message translates to:
  /// **'No workout routines yet. Tap + to add one!'**
  String get noRoutinesMessage;

  /// No description provided for @confirmDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get confirmDeleteTitle;

  /// No description provided for @confirmDeleteRoutineContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{routineName}\"? This will also delete all associated exercises.'**
  String confirmDeleteRoutineContent(String routineName);

  /// No description provided for @cancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  /// No description provided for @deleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteButton;

  /// No description provided for @addRoutineButton.
  ///
  /// In en, this message translates to:
  /// **'Add Routine'**
  String get addRoutineButton;

  /// No description provided for @editRoutineButton.
  ///
  /// In en, this message translates to:
  /// **'Edit Routine'**
  String get editRoutineButton;

  /// No description provided for @routineDetailsScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Routine Details'**
  String get routineDetailsScreenTitle;

  /// No description provided for @noExercisesMessage.
  ///
  /// In en, this message translates to:
  /// **'No exercises for this routine yet. Tap + to add one!'**
  String get noExercisesMessage;

  /// No description provided for @confirmDeleteExerciseContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{exerciseName}\"?'**
  String confirmDeleteExerciseContent(String exerciseName);

  /// No description provided for @addExerciseButton.
  ///
  /// In en, this message translates to:
  /// **'Add Exercise'**
  String get addExerciseButton;

  /// No description provided for @addExerciseTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Exercise'**
  String get addExerciseTitle;

  /// No description provided for @editExerciseTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit {exerciseName}'**
  String editExerciseTitle(String exerciseName);

  /// No description provided for @exerciseNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Exercise Name'**
  String get exerciseNameLabel;

  /// No description provided for @exerciseNameHint.
  ///
  /// In en, this message translates to:
  /// **'Eg. Shoulder Press'**
  String get exerciseNameHint;

  /// No description provided for @exerciseNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Exercise name is required.'**
  String get exerciseNameRequired;

  /// No description provided for @categoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Category (Optional)'**
  String get categoryLabel;

  /// No description provided for @categoryHint.
  ///
  /// In en, this message translates to:
  /// **'Eg. Upper Body, Cardio'**
  String get categoryHint;

  /// No description provided for @setsLabel.
  ///
  /// In en, this message translates to:
  /// **'Sets'**
  String get setsLabel;

  /// No description provided for @setsHint.
  ///
  /// In en, this message translates to:
  /// **'Eg. 3'**
  String get setsHint;

  /// No description provided for @setsRequired.
  ///
  /// In en, this message translates to:
  /// **'Sets is required and must be a number.'**
  String get setsRequired;

  /// No description provided for @repsStepsLabel.
  ///
  /// In en, this message translates to:
  /// **'Reps/Steps'**
  String get repsStepsLabel;

  /// No description provided for @repsStepsHint.
  ///
  /// In en, this message translates to:
  /// **'Eg. 10-12'**
  String get repsStepsHint;

  /// No description provided for @repsStepsRequired.
  ///
  /// In en, this message translates to:
  /// **'Reps/Steps is required and must be a number.'**
  String get repsStepsRequired;

  /// No description provided for @rpeOptionalLabel.
  ///
  /// In en, this message translates to:
  /// **'RPE (Optional)'**
  String get rpeOptionalLabel;

  /// No description provided for @enterRpeHint.
  ///
  /// In en, this message translates to:
  /// **'Enter RPE (1-10)'**
  String get enterRpeHint;

  /// No description provided for @invalidRpeRange.
  ///
  /// In en, this message translates to:
  /// **'RPE must be between 1 and 10.'**
  String get invalidRpeRange;

  /// No description provided for @notesOptionalLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes (Optional)'**
  String get notesOptionalLabel;

  /// No description provided for @enterNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Enter any additional notes...'**
  String get enterNotesHint;

  /// No description provided for @selectImagesButton.
  ///
  /// In en, this message translates to:
  /// **'Select Images'**
  String get selectImagesButton;

  /// No description provided for @selectedImagesCount.
  ///
  /// In en, this message translates to:
  /// **'{count,plural, =0{No images selected} =1{1 image selected} other{{count} images selected}}'**
  String selectedImagesCount(int count);

  /// No description provided for @imageSelectionPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Image selection not implemented yet. Simulated adding a path.'**
  String get imageSelectionPlaceholder;

  /// No description provided for @enterVideoUrlsLabel.
  ///
  /// In en, this message translates to:
  /// **'Enter Video URLs'**
  String get enterVideoUrlsLabel;

  /// No description provided for @addVideoUrlTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add another video URL field'**
  String get addVideoUrlTooltip;

  /// No description provided for @invalidUrlError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid URL.'**
  String get invalidUrlError;

  /// No description provided for @saveChangesButton.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChangesButton;

  /// No description provided for @exerciseAddedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Exercise added successfully!'**
  String get exerciseAddedSuccess;

  /// No description provided for @exerciseUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Exercise updated successfully!'**
  String get exerciseUpdatedSuccess;

  /// No description provided for @saveExerciseError.
  ///
  /// In en, this message translates to:
  /// **'Failed to save exercise'**
  String get saveExerciseError;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'my'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'my': return AppLocalizationsMy();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
