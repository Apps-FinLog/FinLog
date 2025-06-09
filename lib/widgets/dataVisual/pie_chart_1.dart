import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart';

class PieChart1 extends StatefulWidget {
  final double progressValue;
  final String title;
  final bool hidden;
  final double amount;
  final String monthName;
  final bool hasData;

  const PieChart1({
    super.key, 
    required this.progressValue, 
    this.title = '', 
    required this.hidden, 
    required this.amount,
    required this.monthName,
    required this.hasData,
  });

  String formatAmount(double amount) {
    if (amount >= 1000000) {
      double inMillions = amount / 1000000;
      return '${inMillions.toStringAsFixed(1)} Jt';
    } else if (amount >= 1000) {
      double inThousands = amount / 1000;
      return '${inThousands.toStringAsFixed(1)} Rb';
    } else {
      return amount.toStringAsFixed(0);
    }
  }

  @override
  State<PieChart1> createState() => _PieChart1State();
}

class _PieChart1State extends State<PieChart1> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: widget.progressValue,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    _animationController.forward();
  }

  @override
  void didUpdateWidget(PieChart1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progressValue != widget.progressValue) {
      _animation = Tween<double>(
        begin: oldWidget.progressValue,
        end: widget.progressValue,
      ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ));
      _animationController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double circleSize = 140.0;
    const double strokeWidth = 12.0;

    return Center(
      child: SizedBox(
        width: circleSize,
        height: circleSize,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background track
            SizedBox(
              width: circleSize,
              height: circleSize,
              child: CircularProgressIndicator(
                value: 1.0,
                strokeWidth: strokeWidth,
                backgroundColor: Colors.grey[200],
                color: Colors.grey[200],
              ),
            ),
            // Animated progress
            if (widget.hasData)
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return SizedBox(
                    width: circleSize,
                    height: circleSize,
                    child: CircularProgressIndicator(
                      value: _animation.value,
                      strokeWidth: strokeWidth,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _getProgressColor(_animation.value),
                      ),
                      backgroundColor: Colors.transparent,
                      strokeCap: StrokeCap.round,
                    ),
                  );
                },
              ),
            // Center content
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.hidden 
                      ? '***' 
                      : widget.hasData 
                          ? widget.formatAmount(widget.amount)
                          : '0',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: widget.hasData ? finlogBluePrimaryDark : Colors.grey[500],
                  ),
                ),
                Text(
                  widget.monthName,
                  style: TextStyle(
                    fontSize: 14, 
                    color: Colors.grey[600],
                  ),
                ),
                if (widget.hasData && !widget.hidden)
                  Text(
                    '${(widget.progressValue * 100).toStringAsFixed(0)}%',
                    style: TextStyle(
                      fontSize: 12,
                      color: _getProgressColor(widget.progressValue),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getProgressColor(double progress) {
    if (progress >= 0.8) {
      return Colors.red;
    } else if (progress >= 0.5) {
      return Colors.orange;
    } else {
      return finlogBluePrimary;
    }
  }
}
