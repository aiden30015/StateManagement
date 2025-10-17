import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/poke_app/bloc/controller/poke_bloc.dart';
import 'package:state_management/poke_app/bloc/controller/poke_state.dart';
import 'package:state_management/poke_app/core/widgets/poke_base_scaffold.dart';

class PokeListScreen extends StatelessWidget {
  const PokeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PokeBaseScaffold(
      body: BlocBuilder<PokeBloc,PokeState>(
        builder: (context,state) {
          if(state is LoadingState) {
            return CircularProgressIndicator();
          }

          if(state is ErrorState) {
            return Text('Error: ${state.errorMessage}');
          }

          if(state is LoadedState) {
            return ListView.builder(
              itemCount: state.pokeList.length,
              itemBuilder: (context, index) {
                final pokemon = state.pokeList[index];
                return ListTile(
                  title: Text(pokemon.results[index].name),
                );
              },
            );
          }

          else {
            return Text('데이터가 없음');
          }
        },
      ),
    );
  }
}