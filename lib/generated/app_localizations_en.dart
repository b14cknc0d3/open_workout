// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'OpenWorkOut';

  @override
  String get homeScreenTitle => 'My Workout Routines';

  @override
  String get noRoutinesMessage => 'No workout routines yet. Tap + to add one!';

  @override
  String get confirmDeleteTitle => 'Confirm Delete';

  @override
  String confirmDeleteRoutineContent(String routineName) {
    return 'Are you sure you want to delete \"$routineName\"? This will also delete all associated exercises.';
  }

  @override
  String get cancelButton => 'Cancel';

  @override
  String get deleteButton => 'Delete';

  @override
  String get addRoutineButton => 'Add Routine';

  @override
  String get editRoutineButton => 'Edit Routine';

  @override
  String get routineDetailsScreenTitle => 'Routine Details';

  @override
  String get noExercisesMessage => 'No exercises for this routine yet. Tap + to add one!';

  @override
  String confirmDeleteExerciseContent(String exerciseName) {
    return 'Are you sure you want to delete \"$exerciseName\"?';
  }

  @override
  String get addExerciseButton => 'Add Exercise';

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
