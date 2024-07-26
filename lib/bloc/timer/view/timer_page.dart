import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space/bloc/timer/bloc/timer_bloc.dart';
import 'package:space/bloc/timer/bloc/timer_event.dart';
import 'package:space/bloc/timer/bloc/timer_state.dart';
import 'package:space/bloc/timer/ticker.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: const Ticker()),
      child: const TimerView(),
    );
  }
}

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Timer")),
      body: const Stack(
        children: [
          Background(),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(child: TimerText()),
              ),
              Actions(),
            ],
          ),
        ],
      ),
    );
  }
}

class TimerText extends StatelessWidget {
  const TimerText({super.key});

  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr = ((duration / 60) % 60).floor().toString().padLeft(2, "0");
    final secondStr = (duration % 60).floor().toString().padLeft(2, "0");
    return Text(
      "$minutesStr:$secondStr",
      style: const TextStyle(color: Colors.red),
      // Theme.of(context).textTheme.headlineLarge,
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...switch (state) {
            TimerInitial() => [
                FloatingActionButton(
                  child: const Icon(Icons.play_arrow),
                  onPressed: () => context.read<TimerBloc>().add(TimerStarted(duration: state.duration)),
                ),
              ],
            TimerRunPause() => [
                FloatingActionButton(
                  child: const Icon(Icons.play_arrow),
                  onPressed: () => context.read<TimerBloc>().add(TimerResumed()),
                ),
                FloatingActionButton(
                  child: const Icon(Icons.replay),
                  onPressed: () => context.read<TimerBloc>().add(TimerReset()),
                ),
              ],
            TimerRunInProgress() => [
                FloatingActionButton(
                  child: const Icon(Icons.pause),
                  onPressed: () => context.read<TimerBloc>().add(TimerPaused()),
                ),
                FloatingActionButton(
                  child: const Icon(Icons.replay),
                  onPressed: () => context.read<TimerBloc>().add(TimerReset()),
                ),
              ],
            TimerRunComplete() => [
                FloatingActionButton(
                  child: const Icon(Icons.replay),
                  onPressed: () => context.read<TimerBloc>().add(TimerReset()),
                ),
              ],
          }
        ],
      );
    });
  }
}

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade50,
            Colors.blue.shade500,
          ],
        ),
      ),
    );
  }
}
