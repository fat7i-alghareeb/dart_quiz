import 'dart:math';
import 'dart:async';

void main() async {
  print('calling getRandomNumberAfterDelay:');
  int randomNumber = await getRandomNumberAfterDelay();
  print('returned random number: $randomNumber\n');
  print('finish from getRandomNumberAfterDelay:');
  print('--------------------------------------------');
  print('calling getRandomNumberAfterDelay:');

  Stream<int> randomNumberStream = generateRandomNumberStream();
  // call the function that generates a stream of random numbers
  randomNumberStream.listen((data) {
    print('Received: $data');
  }, onDone: () {
    print('done');
  });
}

Future<int> getRandomNumberAfterDelay() async {
  await Future.delayed(Duration(seconds: 3));
  int randomNumber = Random().nextInt(100);
  return randomNumber;
}

Stream<int> generateRandomNumberStream() {
  final StreamController<int> controller = StreamController<int>();
  var count = 1;

  Timer.periodic(Duration(seconds: 1), (Timer t) {
    int randomNumber = Random().nextInt(100);

    controller.sink.add(randomNumber);
    count++;

    if (count > 10) {
      controller.close();
      t.cancel();
    }
  });

  return controller.stream;
}
