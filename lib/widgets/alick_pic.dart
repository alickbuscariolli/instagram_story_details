import 'package:flutter/material.dart';

class AlickPic extends StatelessWidget {
  const AlickPic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundImage: NetworkImage(
        'https://scontent.fmel16-1.fna.fbcdn.net/v/t39.30808-6/275930316_5362927647074273_6009826876797863845_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=PdckYJxXqMAAX9c-3K4&_nc_ht=scontent.fmel16-1.fna&oh=00_AT_Ibd4zCMioDA0x62lwAjEkWuL6w8E-CY0z2gJx_LcxXg&oe=6357BF98',
      ),
    );
  }
}
