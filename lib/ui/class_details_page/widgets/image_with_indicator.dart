import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:three_sixty_kids/data/controllers/class_detail_controller.dart';
import 'package:three_sixty_kids/utils/colors.dart';
import 'package:three_sixty_kids/utils/dimensions.dart';
import 'package:three_sixty_kids/widgets/rounded_network_image.dart';
import 'package:get/get.dart';
class ImageWithIndicator extends StatefulWidget {
  final List<String> imgList;
  //final Function(int) onTapMovie;
  const ImageWithIndicator({super.key,
    required this.imgList,
    //required this.onTapMovie
  });

  @override
  State<ImageWithIndicator> createState() => _ImageWithIndicatorState();
}

class _ImageWithIndicatorState extends State<ImageWithIndicator> {

  int _postiion = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 4,
          child: PageView(
            onPageChanged: (page){
              setState(() {
                _postiion = page;
              });
            },
          /*  children: widget.imgList
                .map((img) => BannerView(
                  (movieId) => widget.onTapMovie(movieId),  popularMovie,
            ),*/
            children: widget.imgList
                .map((img) => RoundedNetworkImage(
                    url: img,
                    height: MediaQuery.of(context).size.height / 4,
                    width: double.maxFinite,
            ),
            ).toList(),
          ),
        ),
        SizedBox(height: Dimensions.height10,),
        DotsIndicator(
          //dotsCount : widget.mPopularMovieList.length ,
            dotsCount : widget.imgList.length ,
            position : _postiion,
            decorator : DotsDecorator(
              activeColor: AppColors.mainColor,
              color: Colors.grey,
            )
        ),
      ],
    );
  }
}
