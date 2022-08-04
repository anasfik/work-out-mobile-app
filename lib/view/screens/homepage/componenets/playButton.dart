import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Theme.of(context).primaryColor.withOpacity(0.15),
      ),
      width: 70,
      height: 70,
      child: SizedBox(
        width: 40,
        child: IconButton(
          onPressed: () {},
          icon: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(50)),
            padding: const EdgeInsets.all(15),
            child: const Icon(
              Icons.play_arrow,
            ),
          ),
        ),
      ),
    );
  }
}
