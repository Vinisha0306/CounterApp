import 'package:counter_app/header.dart';
import 'package:counter_app/utils/appDat.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> isSelected = [false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: ListView.builder(
        itemCount: counterData.length,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black12,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      counterData[index]['counter']--;
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.exposure_minus_1,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(counterData[index]['title']),
                      Text(
                        counterData[index]['counter'].toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      counterData[index]['counter']++;
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.plus_one,
                    ),
                  ),
                ],
              ),
            ),
            ToggleButtons(
              onPressed: (int index) {
                isSelected[index] = !isSelected[index];
              },
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              isSelected: isSelected,
              children: [
                OutlinedButton(
                  onPressed: () {
                    counterData.remove(counterData[index]);
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.delete,
                  ),
                ),
                OutlinedButton(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (context) => StatefulBuilder(
                        builder: (context, setState) => AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        counterData[index]['counter'] -= 10;
                                        setState(() {});
                                      },
                                      child: const Text('-10'),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(counterData[index]['title']),
                                        Text(
                                          counterData[index]['counter']
                                              .toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        counterData[index]['counter'] += 10;
                                        setState(() {});
                                      },
                                      child: const Text('+10'),
                                    ),
                                  ],
                                ),
                              ),
                              FilledButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState;
                                },
                                child: const Text('Done'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).then(
                      (value) => setState(() {}),
                    );
                  },
                  child: const Icon(
                    Icons.edit,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.red,
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton.icon(
          icon: const Icon(Icons.add),
          label: const Text('Add Counter'),
          onPressed: () {
            counterData.add(
              {"title": "Counter ${counterData.length + 1}", "counter": 0},
            );
            setState(() {});
          },
        ),
      ),
    );
  }
}
