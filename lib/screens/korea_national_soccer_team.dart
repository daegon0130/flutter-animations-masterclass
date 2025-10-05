import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Player {
  final String name;
  final String position;
  final String imagePath;
  final int birthYear;
  final int height;
  final int weight;
  final String club;
  final List<String> career;
  final int jerseyNumber;

  Player({
    required this.name,
    required this.position,
    required this.imagePath,
    required this.birthYear,
    required this.height,
    required this.weight,
    required this.club,
    required this.career,
    required this.jerseyNumber,
  });
}

class KoreaNationalSoccerTeam extends StatefulWidget {
  const KoreaNationalSoccerTeam({super.key});

  @override
  State<KoreaNationalSoccerTeam> createState() =>
      _KoreaNationalSoccerTeamState();
}

class _KoreaNationalSoccerTeamState extends State<KoreaNationalSoccerTeam> {
  final PageController _pageController = PageController(
    viewportFraction: 0.8,
  );

  int _currentPage = 0;
  bool _showDetail = false;
  final ValueNotifier<double> _scroll = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page == null) return;
      _scroll.value = _pageController.page!;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() {
      _showDetail = true;
    });
  }

  void _hideDetail() {
    setState(() {
      _showDetail = false;
    });
  }

  void _onPageChanged(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }

  final List<Player> players = [
    Player(
      name: '손흥민',
      position: 'Forward',
      imagePath: 'assets/korea_national_soccer_team/korea_no7.png',
      birthYear: 1992,
      height: 183,
      weight: 77,
      club: 'Tottenham Hotspur',
      career: [
        '2010-2013: 함부르크 SV',
        '2013-2015: 바이어 04 레버쿠젠',
        '2015-현재: 토트넘 홋스퍼',
        '2010-현재: 대한민국 국가대표'
      ],
      jerseyNumber: 7,
    ),
    Player(
      name: '김승규',
      position: 'Goalkeeper',
      imagePath: 'assets/korea_national_soccer_team/korea_no1.png',
      birthYear: 1990,
      height: 190,
      weight: 84,
      club: 'Al-Shabab',
      career: [
        '2012-2016: 울산 현대',
        '2017-2019: 비셀 고베',
        '2020-현재: 알샤바브',
        '2017-현재: 대한민국 국가대표'
      ],
      jerseyNumber: 1,
    ),
    Player(
      name: '김민재',
      position: 'Defender',
      imagePath: 'assets/korea_national_soccer_team/korea_no4.png',
      birthYear: 1996,
      height: 190,
      weight: 85,
      club: 'Bayern Munich',
      career: [
        '2017-2018: 전북 현대',
        '2018-2019: 베이징 궈안',
        '2019-2022: 페네르바체',
        '2022-2023: 나폴리',
        '2023-현재: 바이에른 뮌헨',
        '2017-현재: 대한민국 국가대표'
      ],
      jerseyNumber: 4,
    ),
    Player(
      name: '황인범',
      position: 'Midfielder',
      imagePath: 'assets/korea_national_soccer_team/korea_no6.png',
      birthYear: 1996,
      height: 185,
      weight: 78,
      club: 'Feyenoord',
      career: [
        '2016-2018: 대구 FC',
        '2019-2021: 밴쿠버 화이트캡스',
        '2021-2023: 올림피아코스',
        '2023-현재: 페예노르트',
        '2017-현재: 대한민국 국가대표'
      ],
      jerseyNumber: 6,
    ),
    Player(
      name: '황희찬',
      position: 'Forward',
      imagePath: 'assets/korea_national_soccer_team/korea_no11.png',
      birthYear: 1996,
      height: 173,
      weight: 68,
      club: 'Wolverhampton',
      career: [
        '2014-2016: FC 리펜',
        '2016-2020: RB 잘츠부르크',
        '2020-2021: RB 라이프치히',
        '2021-현재: 울버햄튼',
        '2016-현재: 대한민국 국가대표'
      ],
      jerseyNumber: 11,
    ),
    Player(
      name: '이강인',
      position: 'Midfielder',
      imagePath: 'assets/korea_national_soccer_team/korea_no18.png',
      birthYear: 2001,
      height: 173,
      weight: 68,
      club: 'Paris Saint-Germain',
      career: [
        '2018-2019: 발렌시아 B',
        '2019-2021: 발렌시아',
        '2021-2022: RCD 마요르카 (임대)',
        '2022-2023: RCD 마요르카',
        '2023-현재: 파리 생제르맹',
        '2019-현재: 대한민국 국가대표'
      ],
      jerseyNumber: 18,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.red,
              Colors.black,
            ],
          ),
        ),
        child: Stack(
          children: [
            _buildPlayersPage().animate(target: _showDetail ? 1 : 0).slideY(
                  begin: 0,
                  end: -0.9,
                  duration: 800.ms,
                  curve: Curves.easeInOut,
                ),
            _buildDetailScreen().animate(target: _showDetail ? 1 : 0).slideY(
                  begin: 1,
                  end: 0.1,
                  duration: 800.ms,
                  curve: Curves.easeInOut,
                ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayersPage() {
    return Stack(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Container(
            key: ValueKey(_currentPage),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
                const Spacer(),
                const Text(
                  '대한민국 국가대표팀',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const SizedBox(width: 48),
              ],
            ),
          ),
        ),
        Positioned(
          top: 120,
          left: 0,
          right: 0,
          child: Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  'assets/korea_national_soccer_team/korea_amblem.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: 220,
          child: PageView.builder(
            onPageChanged: _onPageChanged,
            controller: _pageController,
            itemCount: players.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final player = players[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ValueListenableBuilder(
                    valueListenable: _scroll,
                    builder: (context, scroll, child) {
                      final difference = (scroll - index).abs();
                      final scale = 1 - (difference * 0.1);
                      final opacity = 1 - (difference * 0.3);

                      return GestureDetector(
                        onTap: _onTap,
                        child: Transform.scale(
                          scale: scale,
                          child: Opacity(
                            opacity: opacity.clamp(0.3, 1.0),
                            child: Container(
                              height: 400,
                              width: 280,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.5),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                    offset: const Offset(0, 10),
                                  )
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Image.asset(
                                        player.imagePath,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.transparent,
                                              Colors.transparent,
                                              Colors.black
                                                  .withValues(alpha: 0.7),
                                            ],
                                            stops: const [0.0, 0.6, 1.0],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  Text(
                    player.name,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          player.position,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${player.jerseyNumber}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.3, end: 0),
        ),
        if (!_showDetail)
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white.withValues(alpha: 0.8),
                  size: 24,
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildDetailScreen() {
    final currentPlayer = players[_currentPage];

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 400,
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: IconButton(
                      onPressed: _hideDetail,
                      icon: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.3),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.3),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          currentPlayer.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        currentPlayer.name,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          currentPlayer.position,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 상세 정보 섹션
          Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('기본 정보'),
                  const SizedBox(height: 16),
                  _buildInfoGrid(currentPlayer),
                  const SizedBox(height: 40),
                  _buildSectionTitle('소속 팀'),
                  const SizedBox(height: 16),
                  _buildClubInfo(currentPlayer),
                  const SizedBox(height: 40),
                  _buildSectionTitle('경력 사항'),
                  const SizedBox(height: 16),
                  _buildCareerInfo(currentPlayer),
                  const SizedBox(height: 150),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buildInfoGrid(Player player) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildInfoItem('출생년도', '${player.birthYear}년'),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildInfoItem(
                  '나이', '${DateTime.now().year - player.birthYear}세'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _buildInfoItem('키', '${player.height}cm'),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildInfoItem('몸무게', '${player.weight}kg'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClubInfo(Player player) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.sports_soccer,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '현재 소속팀',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  player.club,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCareerInfo(Player player) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: player.career.asMap().entries.map((entry) {
          final index = entry.key;
          final career = entry.value;

          return Container(
            margin: EdgeInsets.only(
                bottom: index < player.career.length - 1 ? 16 : 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.only(top: 6),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    career,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
