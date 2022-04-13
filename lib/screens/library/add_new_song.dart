import 'package:flutter/material.dart';
import 'package:worshapp/repository/hive_repository.dart';

class AddNewSongs extends StatefulWidget {
  const AddNewSongs({Key? key}) : super(key: key);

  @override
  State<AddNewSongs> createState() => _AddNewSongsState();
}

class _AddNewSongsState extends State<AddNewSongs> {
  late String editedLyrics;
  HiveRepository repository = HiveRepository();
  late String nameOfSong;
  late String nameofAthur;
  @override
  void initState() {
    repository.openHive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          onPressed: () async {
            repository.writeListOfSongs(Lyrics(nameOfSong, editedLyrics, nameofAthur));
            Navigator.pop(context);
          },
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      onChanged: (value) {
                        setState(() {
                          nameOfSong = value;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Поле не должно быть пустым";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        errorStyle: TextStyle(fontSize: 11),
                        prefixStyle: TextStyle(color: Colors.black),
                        hintText: 'Название хвалы',
                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        labelText: 'Название хвалы',
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      onChanged: (value) {
                        setState(() {
                          nameofAthur = value;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Поле не должно быть пустым";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        errorStyle: TextStyle(fontSize: 11),
                        prefixStyle: TextStyle(color: Colors.black),
                        hintText: 'Имя исполниела',
                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        labelText: 'Имя исполнитела',
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      initialValue: "Вставте текст песни",
                      maxLines: 50,
                      onChanged: (value) {
                        setState(() {
                          // repository.writeToHive(value);
                          editedLyrics = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
