void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2val = await task2();
  task3(task2val);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future task2() async {
  Duration threeSec = Duration(seconds: 3);
  //sleep(threeSec); sync method
  String result;

  await Future.delayed(threeSec, () {
    //async method
    result = 'task 2 data';
    print('Task 2 complete');
  });

  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}
