import 'package:sleep_walking_detector/consts/consts.dart';
import 'package:sleep_walking_detector/widgets_common/bg_widget.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child:Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(imgProfile2, width: 130,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
                    Expanded(
                      child: Column(
                        children: [
                          "Dummy User".text.fontFamily(semibold).white.make(),
                          5.heightBox,

                        ],
                      )
                    )
                  ],
                )
              ],
            ),
          ), 
        ),
      )
    );
  }
}