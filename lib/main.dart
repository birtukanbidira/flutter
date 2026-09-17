import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GamsGo Page',
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF85555),
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF85555),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _TopNavBar(),
              const SizedBox(height: 48),
              const Center(
                child: Text(
                  'Save up to 85% on premium AI, streaming, and gaming subscriptions with GamsGo.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 46,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Trusted by 10M+ users across 150+ countries for 7 years',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 42),
              const _CategoryRow(),
              const SizedBox(height: 28),
              LayoutBuilder(
                builder: (context, constraints) {
                  final compact = constraints.maxWidth < 1050;
                  final cards = const [
                    _ProductCard(
                      title: 'ChatGPT',
                      badge: 'ChatGPT Images 2.5',
                      price: '\$4.83',
                      bullets: [
                        'Fast response and stable service',
                        'Shared subscription with low monthly fee',
                      ],
                    ),
                    _ProductCard(
                      title: 'Cursor',
                      price: '\$17.99',
                      bullets: [
                        'Offers Pro and Pro+ plans with flexible options',
                        'Automated bug detection and repair functionality',
                      ],
                    ),
                    _ProductCard(
                      title: 'Spotify',
                      price: '\$4.50',
                      bullets: [
                        'Advanced individual plan and stable subscription',
                        'Ad-free listening experience and downloads',
                      ],
                    ),
                  ];

                  if (compact) {
                    return Column(
                      children: cards
                          .map(
                            (card) => Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: card,
                            ),
                          )
                          .toList(),
                    );
                  }

                  return Row(
                    children: List.generate(
                      cards.length,
                      (index) => Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: index == cards.length - 1 ? 0 : 18,
                          ),
                          child: cards[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 22),
              const _CookieBanner(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopNavBar extends StatelessWidget {
  const _TopNavBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'GamsGo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(width: 42),
        const _NavItem('Subscription'),
        const _NavItem('Game'),
        const _NavItem('Support'),
        const Spacer(),
        Expanded(
          flex: 3,
          child: Container(
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFFF96D6D),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  'Search in GamsGo',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 14),
        _pill('EN | USD'),
        const SizedBox(width: 14),
        const Text(
          'Log in / Sign up',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  static Widget _pill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF96D6D),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 34),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _CategoryRow extends StatelessWidget {
  const _CategoryRow();

  @override
  Widget build(BuildContext context) {
    const categories = [
      ('ALL', Icons.grid_view_rounded, true),
      ('SVOD', Icons.movie_creation_outlined, false),
      ('AI', Icons.memory_rounded, false),
      ('Music', Icons.music_note_rounded, false),
      ('Marketplace', Icons.storefront_outlined, false),
      ('Top up', Icons.flutter_dash_outlined, false),
      ('Software', Icons.code_rounded, false),
      ('Games', Icons.gamepad_rounded, false),
      ('New', Icons.auto_awesome_outlined, false),
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: categories
              .map(
                (item) => _CategoryChip(
                  label: item.$1,
                  icon: item.$2,
                  selected: item.$3,
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 16),
        Container(height: 2, color: const Color(0x66FFFFFF)),
      ],
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.label,
    required this.icon,
    required this.selected,
  });

  final String label;
  final IconData icon;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
            color: selected ? const Color(0xFFF85555) : Colors.white,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: selected ? const Color(0xFFF85555) : Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.title,
    required this.price,
    required this.bullets,
    this.badge,
  });

  final String title;
  final String price;
  final List<String> bullets;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            padding: const EdgeInsets.all(24),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (badge != null)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFBEF9A3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      badge!,
                      style: const TextStyle(
                        color: Color(0xFF279A2A),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF1D1D1F),
                    fontSize: 46,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
            color: const Color(0xFFF85555),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 54,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  '/ month',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 22, 24, 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: bullets
                  .map(
                    (text) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: Icon(
                              Icons.check,
                              color: Color(0xFFF85555),
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              text,
                              style: const TextStyle(
                                color: Color(0xFFF85555),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _CookieBanner extends StatelessWidget {
  const _CookieBanner();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 580,
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0x22000000),
              blurRadius: 16,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Cookie & Privacy',
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'We use cookies to enhance your experience. By continuing, you agree to our use of cookies. For full details please see our Privacy and Cookies Policy.',
              style: TextStyle(
                color: Color(0xFF616161),
                fontSize: 24,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF218BFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {},
                child: const Text(
                  'Accept recommended settings',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
