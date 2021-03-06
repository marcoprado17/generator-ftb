import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_example/shared/components/sample_increment_counter/sample_increment_counter_bloc.dart';

class SampleIncrementCounterComponent extends StatelessWidget {
  static const Color backgrounColor = Color.fromARGB(200, 255, 192, 203);
  final String name;
  final sampleIncrementCounterRepository;

  SampleIncrementCounterComponent({
    @required this.name,
    @required this.sampleIncrementCounterRepository
  }) : super(key: Key(name));

  @override
  Widget build(BuildContext context) {
    final String keyAsString =
        key.toString().substring(3, key.toString().length - 3);

    return BlocProvider<SampleIncrementCounterBloc>(
      create: (context) => SampleIncrementCounterBloc(sampleIncrementCounterRepository: null

      ),
      child:
          BlocBuilder<SampleIncrementCounterBloc, SampleIncrementCounterState>(
        builder: (BuildContext context, state) {
          return GestureDetector(
            onTap: () {
              BlocProvider.of<SampleIncrementCounterBloc>(context)
                  .add(Increment());
            },
            child: Container(
              color: backgrounColor,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      keyAsString,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    child: Text(
                      state.count.toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
