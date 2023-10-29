import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {

  static const String name = 'counter_screen';
   
  const CounterScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clicCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);


    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
        actions: [
          IconButton(
            onPressed:() {
            ref.read(isDarkModeProvider.notifier).update((state) => !state);
          }, icon:
            isDarkMode
           ? Icon(Icons.sunny)
           : Icon(Icons.cloud)
           )
        ],
      ),
      body: Center(
         child: Text(clicCounter.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.abc),
        
        onPressed:() {
          // ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        ) ,
    );
  }
}