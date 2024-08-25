import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habitprovider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
        onPressed: () {
          _addHabit(context);
        },
      ),
      backgroundColor: Colors.grey[100],
      body: Consumer<HabitProvider>(
        builder: (context, provider, child) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Stack(
                    children: [
                      Image.asset('assets/MainBackground.png'),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 140, 0, 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Hey Bhupendra!",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "You have ${provider.habits.length - provider.counter} habits left for today",
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Keep Going!",
                                style: TextStyle(color: Colors.grey[600], fontSize: 16),
                              ),
                              Text(
                                "${((provider.counter / provider.habits.length) * 100).round()}%",
                                style: TextStyle(color: Colors.grey[600], fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              minHeight: 12,
                              color: Colors.deepPurpleAccent,
                              backgroundColor: const Color.fromARGB(255, 192, 170, 250),
                              value: provider.habits.isNotEmpty
                                  ? provider.counter / provider.habits.length
                                  : 0.0,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Divider(),
                        ),
                        SizedBox(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: provider.habits.length,
                            itemBuilder: (context, int index) {
                              final habit = provider.habits[index];
                              return ListTile(
                                title: Text(habit.title),
                                subtitle: Text(habit.description),
                                trailing: habit.icon,
                                leading: Checkbox(
                                  value: habit.isCompleted,
                                  onChanged: (value) {
                                    provider.toggleHabit(index, value!);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _addHabit(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController habitNameController = TextEditingController(text: "Habit Name");
        TextEditingController habitDescriptionController = TextEditingController(text: "Habit Description");

        return AlertDialog(
          title: const Text("Add a Habit"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(controller: habitNameController),
              TextFormField(controller: habitDescriptionController),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel",style: TextStyle(color: Colors.white),),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              ),
              onPressed: () {
                Provider.of<HabitProvider>(context, listen: false).addHabit(
                  habitNameController.text,
                  habitDescriptionController.text,
                );
                Navigator.pop(context);
              },
              child: const Text("Save",style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      },
    );
  }
}
