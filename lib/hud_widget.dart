import 'package:explodingcats/core/classes/card_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import 'game_loop_bloc/game_loop_bloc.dart';

class HUDWidget extends StatelessWidget {
  const HUDWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(0, -3),
            spreadRadius: 1,
            blurRadius: 5)
      ]),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      child: BlocBuilder<GameLoopBloc, GameLoopState>(
        builder: (context, state) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ScrollSnapList(
                      scrollDirection: Axis.vertical,
                      itemCount: state.myDeck.length,
                      itemSize: 70,
                      dynamicItemSize: true,
                      onItemFocus: (int index) {},
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black)),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: 10,
                        height: 50,
                        child: Center(
                          child: Text(
                              CardClassUtils.getTitleFromClass(
                                  state.myDeck[index]),
                              maxLines: 1),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<GameLoopBloc>()
                            .add(GameLoopEndMoveEvent());
                      },
                      child: Text("Завершить ход!"),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
