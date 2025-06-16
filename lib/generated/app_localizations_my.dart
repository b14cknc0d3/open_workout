// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Burmese (`my`).
class AppLocalizationsMy extends AppLocalizations {
  AppLocalizationsMy([String locale = 'my']) : super(locale);

  @override
  String get appTitle => 'OpenWorkOut';

  @override
  String get homeScreenTitle => 'ကျွန်ုပ်၏လေ့ကျင့်ခန်းအစီအစဉ်များ';

  @override
  String get noRoutinesMessage => 'လေ့ကျင့်ခန်းအစီအစဉ်များ မရှိသေးပါ။ ထည့်သွင်းရန် + ကိုနှိပ်ပါ။';

  @override
  String get confirmDeleteTitle => 'ဖျက်ရန် အတည်ပြုပါ';

  @override
  String confirmDeleteRoutineContent(String routineName) {
    return '\"$routineName\" ကို ဖျက်ရန် သေချာပါသလား။ ၎င်းနှင့်ဆက်စပ်သော လေ့ကျင့်ခန်းများအားလုံးကိုလည်း ဖျက်ပါမည်။';
  }

  @override
  String get cancelButton => 'ဖျက်သိမ်းမည်';

  @override
  String get deleteButton => 'ဖျက်မည်';

  @override
  String get addRoutineButton => 'အစီအစဉ်ထည့်မည်';

  @override
  String get editRoutineButton => 'အစီအစဉ်ပြင်မည်';

  @override
  String get routineDetailsScreenTitle => 'အစီအစဉ်အသေးစိတ်';

  @override
  String get noExercisesMessage => 'ဤအစီအစဉ်အတွက် လေ့ကျင့်ခန်းများ မရှိသေးပါ။ ထည့်သွင်းရန် + ကိုနှိပ်ပါ။';

  @override
  String confirmDeleteExerciseContent(String exerciseName) {
    return '\"$exerciseName\" ကို ဖျက်ရန် သေချာပါသလား။';
  }

  @override
  String get addExerciseButton => 'လေ့ကျင့်ခန်းထည့်မည်';

  @override
  String get addExerciseTitle => 'Add Exercise';

  @override
  String editExerciseTitle(String exerciseName) {
    return 'Edit $exerciseName';
  }

  @override
  String get exerciseNameLabel => 'Exercise Name';

  @override
  String get exerciseNameHint => 'Eg. Shoulder Press';

  @override
  String get exerciseNameRequired => 'Exercise name is required.';

  @override
  String get categoryLabel => 'Category (Optional)';

  @override
  String get categoryHint => 'Eg. Upper Body, Cardio';

  @override
  String get setsLabel => 'Sets';

  @override
  String get setsHint => 'Eg. 3';

  @override
  String get setsRequired => 'Sets is required and must be a number.';

  @override
  String get repsStepsLabel => 'Reps/Steps';

  @override
  String get repsStepsHint => 'Eg. 10-12';

  @override
  String get repsStepsRequired => 'Reps/Steps is required and must be a number.';

  @override
  String get rpeOptionalLabel => 'RPE (Optional)';

  @override
  String get enterRpeHint => 'Enter RPE (1-10)';

  @override
  String get invalidRpeRange => 'RPE must be between 1 and 10.';

  @override
  String get notesOptionalLabel => 'Notes (Optional)';

  @override
  String get enterNotesHint => 'Enter any additional notes...';

  @override
  String get selectImagesButton => 'Select Images';

  @override
  String selectedImagesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count images selected',
      one: '1 image selected',
      zero: 'No images selected',
    );
    return '$_temp0';
  }

  @override
  String get imageSelectionPlaceholder => 'Image selection not implemented yet. Simulated adding a path.';

  @override
  String get enterVideoUrlsLabel => 'Enter Video URLs';

  @override
  String get addVideoUrlTooltip => 'Add another video URL field';

  @override
  String get invalidUrlError => 'Please enter a valid URL.';

  @override
  String get saveChangesButton => 'Save Changes';

  @override
  String get exerciseAddedSuccess => 'Exercise added successfully!';

  @override
  String get exerciseUpdatedSuccess => 'Exercise updated successfully!';

  @override
  String get saveExerciseError => 'Failed to save exercise';
}
