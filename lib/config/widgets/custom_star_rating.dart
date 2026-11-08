import 'package:app/config/app_colors.dart';
import 'package:app/config/assets.dart';
import 'package:app/config/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class StarRatingWidget extends StatefulWidget {
  final double rating;
  final double maxRating;
  final int starCount;
  final double starSize;
  final Color starColor;
  final Color emptyStarColor;
  final Function(double)? onRatingChanged;
  final bool isClickable;
  final bool allowHalfRating;
  final bool isInteractive;

  const StarRatingWidget({
    super.key,
    this.rating = 0.0,
    this.maxRating = 5.0,
    this.starCount = 5,
    this.starSize = 20.0,
    this.starColor = AppColors.starColor,
    this.emptyStarColor = Colors.grey,
    this.onRatingChanged,
    this.allowHalfRating = true,
    this.isInteractive = true,
    this.isClickable = true,
  });

  @override
  _StarRatingWidgetState createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  double _currentRating = 0;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.rating;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn,
      ),
    );
    _updateRating(_currentRating);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _updateRating(double newRating) {
    if (widget.isInteractive && newRating != _currentRating) {
      setState(() {
        _currentRating = newRating;
      });
      if (widget.onRatingChanged != null) {
        widget.onRatingChanged!(_currentRating);
      }
      _animationController.forward().then((_) {
        _animationController.reverse();
      });
    }
  }

  Widget _buildStar(int index) {
    String iconData;
    Color color;

    double ratingPerStar = widget.maxRating / widget.starCount;
    double starRating = (index + 1) * ratingPerStar;
    double halfStarRating = starRating - (ratingPerStar / 2);

    if (_currentRating >= starRating) {
      iconData = Assets.assetsIconsStar;
      color = widget.starColor;
    } else if (widget.allowHalfRating && _currentRating >= halfStarRating) {
      iconData = Assets.assetsIconsStar;
      color = widget.starColor;
    } else {
      iconData = Assets.assetsIconsStar;
      color = widget.emptyStarColor;
    }

    return GestureDetector(
      onTapDown: (details) {
        // if  isClickable is false, do not respond to tap
        if (!widget.isClickable) return;
        if (widget.isInteractive) {
          var localPosition = details.localPosition.dx;
          double newRating;
          if (widget.allowHalfRating && localPosition < widget.starSize / 2) {
            newRating = halfStarRating;
          } else {
            newRating = starRating;
          }
          _updateRating(newRating);
        }
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          double scale = 1.0;
          if (_currentRating >=
              (index + 1) * (widget.maxRating / widget.starCount)) {
            scale = _scaleAnimation.value;
          }
          return Transform.scale(scale: scale, child: child);
        },
        child: SvgWidget(
          icon: iconData,
          color: color,
          height: widget.starSize,
          width: widget.starSize,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.starCount, (index) {
        return _buildStar(index);
      }),
    );
  }
}
