import 'package:abang/components/themes.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class AbangLoading extends StatefulWidget {
  const AbangLoading({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;
  @override
  State<AbangLoading> createState() => _AbangLoadingState();
}

class _AbangLoadingState extends State<AbangLoading>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _fadeController;
  late final Animation<double> _fadeAnimation = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(
    CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ),
  );

  late final Animation<double> _scale = Tween<double>(
    begin: 0.7,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0,
        0.5,
        curve: Curves.easeOut,
      ),
    ),
  );
  late final Animation<double> _scaleMiddleItems = Tween<double>(
    begin: 0.85,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.5,
        1,
        curve: Curves.easeOut,
      ),
    ),
  );

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this)
      ..forward();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Scaffold(
        backgroundColor: abangColors.abangPrimary,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                width: 912 / mockUpWidth * size.width,
                child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (BuildContext context, Widget? child) {
                      return Transform.scale(
                        scale: _scale.value,
                        child: Image.asset(
                          "assets/loadingBlob.png",
                        ),
                      );
                    }),
              ),
              AnimatedBuilder(
                  animation: _animationController,
                  builder: (BuildContext context, Widget? child) {
                    return Transform.scale(
                      scale: _scaleMiddleItems.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/abang_loading_logo.png',
                            width: 86 / mockUpWidth * size.width,
                            height: 77 / mockUpHeight * size.height,
                          ),
                          SizedBox(
                            height: 10 / mockUpHeight * size.height,
                          ),
                          Text(
                            widget.text ?? "Loading",
                            textScaleFactor: textScale,
                            style: abangTextStyles.smallTextStyle.copyWith(
                                color: abangColors.abangWhite, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10 / mockUpHeight * size.height,
                          ),
                          SizedBox.square(
                            dimension: 30 / mockUpWidth * size.width,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: abangColors.abangWhite,
                                strokeWidth: 5 / mockUpWidth * size.width,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
