import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_workout/features/workout_routines/domain/entitiy.dart';
import 'package:open_workout/generated/app_localizations.dart';

class AddEditExerciseScreen extends ConsumerStatefulWidget {
  final String? routineId;
  final ExerciseEntity? initialExercise;
  const AddEditExerciseScreen({
    super.key,
    this.routineId,
    this.initialExercise,
  });

  @override
  ConsumerState<AddEditExerciseScreen> createState() =>
      _AddEditExerciseScreenState();
}

class _AddEditExerciseScreenState extends ConsumerState<AddEditExerciseScreen> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _categoryController;
  late final TextEditingController _setsController;
  late final TextEditingController _repsController;
  late final TextEditingController _rpeController;
  late final TextEditingController _notesController;

  final List<TextEditingController> _videoUrlControllers = [];
  final List<Widget> _videoUrlFields = [];

  final List<String> _selectedImagePaths = [];
  // final bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _categoryController = TextEditingController();
    _setsController = TextEditingController();
    _repsController = TextEditingController();
    _rpeController = TextEditingController();
    _notesController = TextEditingController();
    if (widget.initialExercise != null) {
      _nameController.text = widget.initialExercise!.name;
      _categoryController.text = widget.initialExercise!.category ?? '';
      _setsController.text = widget.initialExercise!.sets.toString();
      _repsController.text = widget.initialExercise!.reps.toString();
      _rpeController.text = widget.initialExercise!.rpe?.toString() ?? '';
      _notesController.text = widget.initialExercise!.notes ?? '';

      _selectedImagePaths.addAll(List.from(widget.initialExercise!.images));
      //TODO: need to check error.
      for (var url in widget.initialExercise!.videos) {
        _addVideoUrlField(initialValue: url);
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_videoUrlControllers.isEmpty) {
      _addVideoUrlField();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _setsController.dispose();
    _repsController.dispose();
    _rpeController.dispose();
    _notesController.dispose();
    for (var controller in _videoUrlControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addVideoUrlField({String? initialValue}) {
    final controller = TextEditingController(text: initialValue);
    _videoUrlControllers.add(controller);
    _videoUrlFields.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.enterVideoUrlsLabel,
                  border: const OutlineInputBorder(),
                  isDense: true,
                ),
                keyboardType: TextInputType.url,
                validator: (value) {
                  if (value!.isNotEmpty && !Uri.tryParse(value)!.isAbsolute) {
                    return AppLocalizations.of(context)!.invalidUrlError;
                  }
                  return null;
                },
              ),
            ),
            if (_videoUrlControllers.length > 1)
              IconButton(
                icon: const Icon(
                  Icons.remove_circle_outline,
                  color: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    final index = _videoUrlControllers.indexOf(controller);
                    if (index != -1) {
                      _videoUrlControllers[index].dispose();
                      _videoUrlControllers.removeAt(index);
                      _videoUrlFields.removeAt(index);
                    }
                  });
                },
              ),
          ],
        ),
      ),
    );
    setState(() {});
  }

  Future<void> _selectImage() async {
    try {
      final pickedFiles = await ImagePicker().pickMultiImage();

      if (pickedFiles.isNotEmpty) {
        // final appDocDir = await getApplicationDocumentsDirectory();
        for (final file in pickedFiles) {
          _selectedImagePaths.add(file.path);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Failed to select image: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final isEditing = widget.initialExercise != null;

    return Scaffold(
      backgroundColor: Color(0xffFCFCF7),
      appBar: AppBar(
        backgroundColor: Color(0xffFCFCF7),
        title: Text(
          isEditing
              ? localizations.editExerciseTitle(widget.initialExercise!.name)
              : localizations.addExerciseTitle,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormTitle(name: localizations.exerciseNameLabel),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: localizations.exerciseNameHint,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return localizations.exerciseNameRequired;
                      }
                      return null;
                    },
                  ),
                  FormTitle(name: localizations.setsLabel),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Eg. 3'),
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                  FormTitle(name: localizations.repsStepsLabel),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Eg. 10-12 Reps'),
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                  FormTitle(name: localizations.rpeOptionalLabel),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Eenter RPE'),
                    keyboardType: TextInputType.numberWithOptions(),
                  ),

                  FilledButton(
                    onPressed: _selectImage,
                    child: Text("Select Images"),
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    children:
                        _selectedImagePaths.map((path) {
                          return Image.file(File(path));
                        }).toList(),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FormTitle(name: localizations.enterVideoUrlsLabel),
                      IconButton(
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.blue,
                        ),
                        onPressed: _addVideoUrlField, // Add new URL field
                        tooltip: localizations.addVideoUrlTooltip,
                      ),
                    ],
                  ),
                  ..._videoUrlFields,
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: () {},
                          child: Text("Add Exercise"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FormTitle extends StatelessWidget {
  final String name;
  const FormTitle({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    );
  }
}
