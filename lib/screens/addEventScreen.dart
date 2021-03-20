import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hacknu21/widgets/customTextField.dart';
import 'package:image_picker/image_picker.dart';

bool _groupValue = false;
Map<String, bool> allCategories = {
  'Category 1': false,
  'Category 2': false,
  'Category 3': false,
  'Category 4': false,
  'Category 5': false,
  'Category 6': false,
  'Category 7': false,
  'Category 8': false,
  'Category 9': false,
  'Category 10': false,
};

class AddEventScreen extends StatefulWidget {
  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController();
    final _subtitleController = TextEditingController();
    final _descriptionController = TextEditingController();
    final _maxVisitController = TextEditingController();
    final _rulesController = TextEditingController();
    final _placeController = TextEditingController();
    String title;
    String subtitle;
    String description;
    File image;
    int maxVisit;
    String rules;
    DateTime dateStart;
    String place;
    List<int> categories;
    DateTime selectedDate = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.now();

    List<Widget> checkboxCreator(setState) {
      List<Widget> result = <Widget>[];
      allCategories.forEach((key, val) {
        result.add(CheckboxListTile(
          value: val,
          onChanged: (value) {
            setState(() {
              val = value;
              allCategories[key] = value;
            });
          },
          title: Text(key),
        ));
      });
      return result;
    }

    void _showDialog(context) {
      showDialog(
          context: context,
          builder: (_) => StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: Text("Select the appropriate categories"),
                    content: ListView(
                      shrinkWrap: true,
                      children: checkboxCreator(setState),
                    ),
                    actions: <Widget>[
                      RaisedButton(
                        color: Colors.amber,
                        child: Text('Close'),
                        onPressed: () {
                          allCategories.forEach(
                              (key, value) => allCategories[key] = false);
                          Navigator.of(context).pop();
                        },
                      ),
                      RaisedButton(
                        color: Colors.greenAccent,
                        child: Text('Select'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          allCategories.forEach(
                              (key, value) => allCategories[key] = false);
                        },
                      ),
                    ],
                  );
                },
              ));
    }

    void _showSuccessDialog(context) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Center(child: Text("Successfully added")),
                content: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.black26,
                  child: Icon(
                    Icons.done,
                    size: 120,
                    color: Colors.amber,
                  ),
                ),
                actions: <Widget>[
                  RaisedButton(
                    color: Colors.amber,
                    child: Text('Close'),
                    onPressed: () {
                      allCategories
                          .forEach((key, value) => allCategories[key] = false);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ));
    }

    Future<void> _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: selectedDate,
        lastDate: DateTime(2022),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.amber,
                surface: Colors.grey[900],
              ),
            ),
            child: child,
          );
        },
      );
      if (picked != null && picked != selectedDate)
        // setState(() {
        selectedDate = picked;
      // });
    }

    Future<void> _selectTime(BuildContext context) async {
      final TimeOfDay picked = await showTimePicker(
          context: context,
          initialTime: selectedTime,
          builder: (BuildContext context, Widget child) {
            return Theme(
              data: ThemeData.dark().copyWith(
                colorScheme: ColorScheme.dark(
                  primary: Colors.amber,
                  surface: Colors.grey[900],
                ),
              ),
              child: child,
            );
          });

      if (picked != null && picked != selectedTime)
        // setState(() {
        selectedTime = picked;
      // });
    }

    File _image;
    final imagePicker = ImagePicker();
    String imagePath;
    bool _isButtonDisabled = false;

    Future getImageCamera(BuildContext context) async {
      final pickedFile = await imagePicker.getImage(source: ImageSource.camera);

      setState(() {
        imagePath = pickedFile.path;
        _image = File(pickedFile.path);
      });
      Navigator.of(context).pop();
    }

    Future getImageGallery(BuildContext context) async {
      final pickedFile =
          await imagePicker.getImage(source: ImageSource.gallery);

      setState(() {
        imagePath = pickedFile.path;
        _image = File(pickedFile.path);
      });
      Navigator.of(context).pop();
    }

    Future<void> _showChoiceDialog(BuildContext context, bool isMessage) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Choose:'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.amber,
                      child: Text(
                        'Gallery',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: _isButtonDisabled
                          ? () => print('Gallery')
                          : () async {
                              setState(() {
                                _isButtonDisabled = true;
                              });
                              try {
                                await getImageGallery(context);
                              } catch (e) {
                                print(e);
                              } finally {
                                setState(() {
                                  _isButtonDisabled = false;
                                });
                              }
                            },
                    ),
                    SizedBox(height: 2),
                    RaisedButton(
                      color: Colors.amber,
                      child: Text(
                        'Camera',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: _isButtonDisabled
                          ? () => print('Camera')
                          : () async {
                              setState(() {
                                _isButtonDisabled = true;
                              });
                              try {
                                await getImageCamera(context);
                              } catch (e) {
                                print(e);
                              } finally {
                                setState(() {
                                  _isButtonDisabled = false;
                                });
                              }
                            },
                    )
                  ],
                ),
              ),
            );
          });
    }

    @override
    void initState() {
      super.initState();
      allCategories.forEach((key, value) => allCategories[key] = false);
    }

    return ListView(
      children: [
        CustomTextField(
            controller: _titleController,
            onChanged: (str) {
              title = str;
            },
            keyboardType: TextInputType.text,
            labelText: " Title of the event"),
        CustomTextField(
            controller: _subtitleController,
            onChanged: (str) {
              subtitle = str;
            },
            keyboardType: TextInputType.text,
            labelText: " Short Description of the event"),
        CustomTextField(
            controller: _descriptionController,
            onChanged: (str) {
              description = str;
            },
            keyboardType: TextInputType.text,
            labelText: " Full Description of the event"),
        CustomTextField(
            controller: _maxVisitController,
            onChanged: (str) {
              maxVisit = str;
            },
            labelText: " Max capacity of the event",
            keyboardType: TextInputType.number),
        CustomTextField(
            controller: _rulesController,
            onChanged: (str) {
              rules = str;
            },
            keyboardType: TextInputType.text,
            labelText: " General rules of the event"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Start time: '),
            RaisedButton(
              color: Colors.amber,
              onPressed: () => _selectDate(context),
              child: Text(
                'Select date',
                style: TextStyle(color: Colors.black),
              ),
            ),
            RaisedButton(
              color: Colors.amber,
              onPressed: () => _selectTime(context),
              child: Text(
                'Select time',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        _myRadioButton(
          title: 'Online event',
          value: false,
          onChanged: (newValue) => setState(() => _groupValue = newValue),
        ),
        _myRadioButton(
          title: 'Offline event',
          value: true,
          onChanged: (newValue) => setState(() => _groupValue = newValue),
        ),
        _groupValue
            ? Container()
            : CustomTextField(
                controller: _placeController,
                onChanged: (str) {
                  place = str;
                },
                keyboardType: TextInputType.text,
                labelText: " Where will the event be held?"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              color: Colors.amber,
              onPressed: () => _showDialog(context),
              child: Text(
                'Select categories',
                style: TextStyle(color: Colors.black),
              ),
            ),
            RaisedButton(
              color: Colors.amber,
              onPressed: () => _showChoiceDialog(context, false),
              child: Text(
                '    Add an image    ',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: RaisedButton(
            color: Colors.amber,
            onPressed: () {
              _showSuccessDialog(context);
              _placeController.clear();
              _rulesController.clear();
              _maxVisitController.clear();
              _descriptionController.clear();
              _titleController.clear();
              _subtitleController.clear();
            },
            child: Text(
              'Add an event',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}

Widget _myRadioButton({String title, bool value, Function onChanged}) =>
    RadioListTile(
      activeColor: Colors.amber,
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(title),
    );
