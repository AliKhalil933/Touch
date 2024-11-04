import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Category_page_View.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Profile_Designer_page_view.dart';
import 'package:share_plus/share_plus.dart';

class StoryView extends StatefulWidget {
  final List<String> imageUrls;
  final int currentIndex;

  const StoryView({
    super.key,
    required this.imageUrls,
    required this.currentIndex,
  });

  @override
  _StoryViewState createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  int _currentIndex = 0;
  late Timer _timer;
  double _progress = 0.0;
  bool _isPaused = false;
  bool _isButtonVisible = true;
  bool _showProductOptions = false;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _startProgress();
  }

  void _startProgress() {
    _progress = 0.0;
    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      if (!_isPaused) {
        setState(() {
          _progress += 0.01;
          if (_progress >= 1.0) {
            _progress = 0.0;
            _nextStory();
          }
        });
      }
    });
  }

  void _nextStory() {
    if (_currentIndex < widget.imageUrls.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.pop(context);
    }
  }

  void _prevStory() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  void _onPressDown() => setState(() => _isPaused = true);
  void _onPressUp() => setState(() => _isPaused = false);

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _shareCurrentStory() {
    Share.share('Check out this story: ${widget.imageUrls[_currentIndex]}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (details) => _onPressDown(),
        onTapUp: (details) {
          _onPressUp();
          final screenWidth = MediaQuery.of(context).size.width;
          if (details.globalPosition.dx > screenWidth / 2) {
            _prevStory();
          } else {
            _nextStory();
          }
        },
        onTapCancel: _onPressUp,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                widget.imageUrls[_currentIndex],
                fit: BoxFit.cover,
              ),
            ),
            _buildProgressIndicator(),
            _buildCloseButton(),
            _buildLogo(),
            _buildShareButton(),
            _buildBottomInfo(),
            _buildSideButton(),
            if (_showProductOptions) _buildProductOptions(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Positioned(
      top: 40,
      left: 16,
      right: 16,
      child: Column(
        children: [
          Row(
            children: widget.imageUrls.asMap().entries.map((entry) {
              int index = entry.key;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: LinearProgressIndicator(
                    value: (index == _currentIndex)
                        ? _progress
                        : (index < _currentIndex ? 1.0 : 0.0),
                    backgroundColor: Colors.white.withOpacity(0.3),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildCloseButton() {
    return Positioned(
      top: 40,
      left: 16,
      child: IconButton(
        icon: const Icon(Icons.close, color: Colors.white, size: 30),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget _buildLogo() {
    return Positioned(
      top: 100,
      left: 16,
      child: SizedBox(
        width: 50,
        height: 50,
        child: Image.asset(
          Assets.assetsAssetsImagesLogo6,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildShareButton() {
    return Positioned(
      top: 62,
      left: 360,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.29),
              offset: const Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.29),
              offset: const Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 0,
            ),
          ],
        ),
        child: IconButton(
          icon: const Icon(Icons.share, color: Colors.black, size: 20),
          onPressed: _shareCurrentStory,
        ),
      ),
    );
  }

  Widget _buildBottomInfo() {
    return Positioned(
      bottom: 20,
      left: 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('lib/assets/logo/profilewoman2.png'),
            ),
            const SizedBox(width: 10),
            const Text(
              'تصميمات ليلي',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const Spacer(),
            _buildStats(),
          ],
        ),
      ),
    );
  }

  Widget _buildStats() {
    return const Row(
      children: [
        Icon(Icons.remove_red_eye, color: Colors.white, size: 20),
        SizedBox(width: 5),
        Text('100', style: TextStyle(color: Colors.white)),
        SizedBox(width: 15),
        Icon(Icons.favorite, color: Colors.pink, size: 20),
        SizedBox(width: 5),
        Text('3', style: TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildSideButton() {
    return Positioned(
      right: 0,
      top: MediaQuery.of(context).size.height / 2 - 25,
      child: Visibility(
        visible: _isButtonVisible,
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isButtonVisible = false;
              _showProductOptions = true;
            });
          },
          child: Image.asset(
            'lib/assets/logo/side_story.png',
            width: 20,
            height: 80,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  Widget _buildProductOptions() {
    return Positioned(
      right: 0,
      top: MediaQuery.of(context).size.height / 2 - 25,
      child: Column(
        children: [
          _buildProductOptionButton('عرض المنتج', CategoryPageView.routeName),
          const SizedBox(height: 10),
          _buildProductOptionButton('عرض المصمم', DesignerPageView.routeName),
        ],
      ),
    );
  }

  Widget _buildProductOptionButton(String title, String routeName) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
