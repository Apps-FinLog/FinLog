import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart'; // Assuming your custom colors are here

class HomeNavbarWidget extends StatelessWidget {
  const HomeNavbarWidget({super.key});

  // Helper widget for the filter buttons
  Widget _buildFilterButton(BuildContext context, String text, IconData iconData, {bool isActive = false}) {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Implement filter action
      },
      icon: Icon(iconData, size: 18, color: isActive ? finlogBluePrimary : Colors.grey[700]),
      label: Text(
        text,
        style: TextStyle(
          color: isActive ? finlogBluePrimary : Colors.grey[700],
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[100], // Very light grey, almost white
        elevation: 0.5,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey[300]!, width: 0.5),
        ),
      ),
    );
  }

  Widget _buildFilterButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildFilterButton(context, 'Pengeluaran', Icons.arrow_upward, isActive: true),
        const SizedBox(width: 12),
        _buildFilterButton(context, 'Kategori', Icons.arrow_downward),
      ],
    );
  }

  Widget _buildSummaryCard(BuildContext context) {
    const double circleSize = 140.0;
    const double strokeWidth = 12.0;
    const double progressValue = 0.65; // Example: 1.3Jt of 2Jt target

    return Card(
      elevation: 2.0,
      margin: EdgeInsets.zero, // Reset margin as parent Padding will handle it
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pengeluaran Mei 2025',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
                ),
                IconButton(
                  icon: Icon(Icons.visibility_off_outlined, color: Colors.grey[600]),
                  onPressed: () {
                    // TODO: Toggle visibility
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
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
                        value: 1.0, // Full circle for track
                        strokeWidth: strokeWidth,
                        backgroundColor: Colors.grey[200],
                        color: Colors.grey[200], // Effectively the track color
                      ),
                    ),
                    // Actual progress
                    SizedBox(
                      width: circleSize,
                      height: circleSize,
                      child: CircularProgressIndicator(
                        value: progressValue,
                        strokeWidth: strokeWidth,
                        valueColor: const AlwaysStoppedAnimation<Color>(finlogBluePrimary),
                        backgroundColor: Colors.transparent, // Make background track visible
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '1,3Jt',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: finlogBluePrimaryDark),
                        ),
                        Text(
                          'Mei',
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Pengeluaran kamu naik 3% nih',
                        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.trending_up, color: Colors.red[400], size: 16),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tinjau keuangan kamu di dashboard rinci',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Navigate to details
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: finlogButtonDark,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Lihat Selengkapnya', style: TextStyle(color: Colors.white, fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCatatCepatCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [finlogBluePrimaryDark, finlogBluePrimary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: finlogBluePrimary.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                'Catat Cepat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(width: 8),
              Icon(Icons.flash_on, color: Colors.white, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Text('Nominal', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 13)),
          const SizedBox(height: 6),
          TextField(
            controller: TextEditingController(text: '1,000,000'), // Placeholder
            style: const TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Catat dengan\ncepat dan mudah~\nketuk disini!',
            style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildCatatJurnalCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [finlogBluePrimary, finlogBluePrimaryDark], // Slightly different gradient
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
         boxShadow: [
          BoxShadow(
            color: finlogBluePrimary.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      'Catat Jurnal',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.chat_bubble_outline, color: Colors.white, size: 20),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Ada guilty confession kamu\njajan apa aja hari ini?',
                  style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              // TODO: Navigate to Jurnal Input
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: finlogButtonDark,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Yuk ~ catat!', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0), // Added top padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
        children: [
          _buildFilterButtons(context),
          const SizedBox(height: 20),
          _buildSummaryCard(context),
          const SizedBox(height: 24),
          _buildCatatCepatCard(context),
          const SizedBox(height: 20),
          _buildCatatJurnalCard(context),
          const SizedBox(height: 20), // Extra padding at the bottom
        ],
      ),
    );
  }
}