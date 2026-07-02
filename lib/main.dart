// ============================================================
// RED LINK — COMPLETE MERGED FILE
// All screens, widgets and models in a single dart file
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// ══════════════════════════════════════════════════════════════
// MODELS (from blood_bank_model.dart & hospital_model.dart)
// ══════════════════════════════════════════════════════════════

class BloodBankModel {
  final String name;
  final String city;
  final String state;
  final String logoInitials;
  final Map<String, int> inventory;
  const BloodBankModel({required this.name, required this.city, required this.state, required this.logoInitials, required this.inventory});
}

enum SosUrgency { critical, high, normal }

class BloodBankSosRequest {
  final String id;
  final String hospitalName;
  final String location;
  final String bloodGroup;
  final int unitsNeeded;
  final String neededIn;
  final String distance;
  final String message;
  final double lat;
  final double lng;
  final SosUrgency urgency;
  bool isResponded;
  bool isRejected;
  BloodBankSosRequest({required this.id, required this.hospitalName, required this.location, required this.bloodGroup, required this.unitsNeeded, required this.neededIn, required this.distance, required this.message, required this.lat, required this.lng, required this.urgency, this.isResponded = false, this.isRejected = false});
}

class HospitalModel {
  final String name;
  final String city;
  final String state;
  final String logoInitials;
  const HospitalModel({required this.name, required this.city, required this.state, required this.logoInitials});
}

enum HospitalRequestUrgency { emergency, high, normal }

class HospitalBloodRequest {
  final String id;
  final String bloodGroup;
  final String reason;
  final String neededIn;
  final int unitsRequired;
  final int donorsResponding;
  final double progressPercent;
  final HospitalRequestUrgency urgency;
  bool isCancelled;
  HospitalBloodRequest({required this.id, required this.bloodGroup, required this.reason, required this.neededIn, required this.unitsRequired, required this.donorsResponding, required this.progressPercent, required this.urgency, this.isCancelled = false});
}

enum DonorResponseStatus { pending, accepted, denied }

class DonorResponse {
  final String id;
  final String donorName;
  final String bloodGroup;
  final String distance;
  final String phone;
  final String requestId;
  final String requestReason;
  DonorResponseStatus status;
  DonorResponse({required this.id, required this.donorName, required this.bloodGroup, required this.distance, required this.phone, required this.requestId, required this.requestReason, this.status = DonorResponseStatus.pending});
}

class NearbyBloodBank {
  final String name;
  final String distance;
  final Map<String, int> availableUnits;
  const NearbyBloodBank({required this.name, required this.distance, required this.availableUnits});
}

// Donor Registration Screen placeholder (donor_registration_screen.dart not uploaded)
class DonorRegistrationScreen extends StatelessWidget {
  final String prefillName;
  final String prefillEmail;
  final String? googlePhotoUrl;
  const DonorRegistrationScreen({super.key, required this.prefillName, required this.prefillEmail, required this.googlePhotoUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Donor Registration')),
      body: Center(child: Text('Welcome, $prefillName')),
    );
  }
}

// ══════════════════════════════════════════════════════════════
// ROLE CARD WIDGET (from widgets/role_card.dart)
// ══════════════════════════════════════════════════════════════

class RoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const RoleCard({super.key, required this.icon, required this.title, required this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFEEEEEE), width: 1.4),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 12, offset: const Offset(0, 4))],
        ),
        child: Row(
          children: [
            Container(
              width: 52, height: 52,
              decoration: const BoxDecoration(color: Color(0xFFFDE8E8), shape: BoxShape.circle),
              child: Icon(icon, color: const Color(0xFFD32F2F), size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF1A1A1A))),
                const SizedBox(height: 3),
                Text(subtitle, style: const TextStyle(fontSize: 13, color: Color(0xFF888888))),
              ]),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Color(0xFFBBBBBB)),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════
// ROLE SELECTION SCREEN
// ══════════════════════════════════════════════════════════════

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 64),

              // ── App Logo ──────────────────────────────────────────────
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Red',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFD32F2F),
                        letterSpacing: 0.5,
                      ),
                    ),
                    TextSpan(
                      text: 'Link',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1A1A1A),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 48),

              // ── Welcome heading ───────────────────────────────────────
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                  letterSpacing: 0.2,
                ),
              ),

              const SizedBox(height: 10),

              // ── Subtitle ──────────────────────────────────────────────
              const Text(
                'Please select your role to continue',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF888888),
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 48),

              // ── Role Cards ────────────────────────────────────────────
              RoleCard(
                icon: Icons.volunteer_activism,
                title: 'I am a Donor',
                subtitle: 'Help save lives in Pune',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const DonorGoogleSignInScreen(),
                    ),
                  );
                },
              ),

              RoleCard(
                icon: Icons.local_hospital,
                title: 'Hospital Staff',
                subtitle: 'Request emergency blood units',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const HospitalLoginScreen(),
                    ),
                  );
                },
              ),

              RoleCard(
                icon: Icons.water_drop,
                title: 'Blood Bank Staff',
                subtitle: 'Manage inventory & SOS calls',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const BloodBankLoginScreen(),
                    ),
                  );
                },
              ),

              const Spacer(),

              // ── Footer ────────────────────────────────────────────────
              const Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Text(
                  "Connecting Pune's blood supply network",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFAAAAAA),
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════
// BLOOD BANK LOGIN SCREEN
// ══════════════════════════════════════════════════════════════

class BloodBankLoginScreen extends StatefulWidget {
  const BloodBankLoginScreen({super.key});

  @override
  State<BloodBankLoginScreen> createState() => _BloodBankLoginScreenState();
}

class _BloodBankLoginScreenState extends State<BloodBankLoginScreen> {
  static const _red = Color(0xFFD32F2F);
  static const _borderColor = Color(0xFFE8AAAA);
  static const _hintColor = Color(0xFFBBBBBB);

  final _formKey = GlobalKey<FormState>();
  final _codeCtrl = TextEditingController();
  bool _obscure = true;

  static const _bloodBanks = [
    'Pune City Blood Bank',
    'Sahyadri Blood Center',
    'Ratna Blood Bank',
    'Jeevandhara Blood Bank',
    'Rakt Seva Blood Bank',
  ];

  // Sample inventory per blood bank
  static const _inventories = <String, Map<String, int>>{
    'Pune City Blood Bank': {
      'A+': 120,
      'A−': 8,
      'B+': 45,
      'B−': 22,
      'AB+': 88,
      'AB−': 2,
      'O+': 156,
      'O−': 4,
    },
    'Sahyadri Blood Center': {
      'A+': 95,
      'A−': 12,
      'B+': 60,
      'B−': 18,
      'AB+': 44,
      'AB−': 5,
      'O+': 110,
      'O−': 9,
    },
    'Ratna Blood Bank': {
      'A+': 70,
      'A−': 3,
      'B+': 30,
      'B−': 10,
      'AB+': 25,
      'AB−': 1,
      'O+': 80,
      'O−': 2,
    },
    'Jeevandhara Blood Bank': {
      'A+': 140,
      'A−': 15,
      'B+': 55,
      'B−': 28,
      'AB+': 60,
      'AB−': 7,
      'O+': 175,
      'O−': 11,
    },
    'Rakt Seva Blood Bank': {
      'A+': 50,
      'A−': 6,
      'B+': 20,
      'B−': 8,
      'AB+': 18,
      'AB−': 3,
      'O+': 65,
      'O−': 5,
    },
  };

  String _selected = 'Pune City Blood Bank';

  InputDecoration _dec(String hint) => InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(color: _hintColor, fontSize: 15),
    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: _borderColor, width: 1.4),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: _red, width: 1.6),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: _red, width: 1.4),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: _red, width: 1.6),
    ),
  );

  String _initials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return name.substring(0, 2).toUpperCase();
  }

  void _proceed() {
    if (_formKey.currentState!.validate()) {
      final bank = BloodBankModel(
        name: _selected,
        city: 'Pune',
        state: 'Maharashtra',
        logoInitials: _initials(_selected),
        inventory: Map<String, int>.from(
          _inventories[_selected] ?? _inventories['Pune City Blood Bank']!,
        ),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => BloodBankDashboardScreen(bank: bank)),
      );
    }
  }

  @override
  void dispose() {
    _codeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Blood Bank Staff Login',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          children: [
            const SizedBox(height: 16),
            Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xFFFDE8E8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.water_drop_rounded,
                  color: _red,
                  size: 36,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Welcome, Blood Bank Staff',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
            const SizedBox(height: 6),
            const Center(
              child: Text(
                'Select your blood bank and enter your staff code',
                style: TextStyle(fontSize: 14, color: Color(0xFF888888)),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 36),
            // Blood bank selector
            const Text(
              'Blood Bank',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _selected,
              decoration: _dec(''),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF1A1A1A),
                size: 22,
              ),
              borderRadius: BorderRadius.circular(16),
              items: _bloodBanks
                  .map((b) => DropdownMenuItem(value: b, child: Text(b)))
                  .toList(),
              onChanged: (v) => setState(() => _selected = v ?? _selected),
              validator: (v) => v == null ? 'Please select a blood bank' : null,
            ),
            const SizedBox(height: 20),
            // Staff code
            const Text(
              'Staff Code',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _codeCtrl,
              obscureText: _obscure,
              decoration: _dec('Enter your staff access code').copyWith(
                suffixIcon: IconButton(
                  onPressed: () => setState(() => _obscure = !_obscure),
                  icon: Icon(
                    _obscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: const Color(0xFFAAAAAA),
                    size: 20,
                  ),
                ),
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Code is required';
                if (v.length < 4) return 'Code must be at least 4 characters';
                return null;
              },
            ),
            const SizedBox(height: 36),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: _proceed,
                icon: const Icon(
                  Icons.login_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                label: const Text(
                  'Continue to Dashboard',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _red,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════
// HOSPITAL LOGIN SCREEN
// ══════════════════════════════════════════════════════════════

class HospitalLoginScreen extends StatefulWidget {
  const HospitalLoginScreen({super.key});

  @override
  State<HospitalLoginScreen> createState() => _HospitalLoginScreenState();
}

class _HospitalLoginScreenState extends State<HospitalLoginScreen> {
  static const _red = Color(0xFFD32F2F);
  static const _borderColor = Color(0xFFE8AAAA);
  static const _hintColor = Color(0xFFBBBBBB);

  final _formKey = GlobalKey<FormState>();
  final _hospitalCtrl = TextEditingController(text: 'Ruby Hall Clinic');
  final _codeCtrl = TextEditingController();
  bool _obscure = true;

  // Preset hospitals for the demo dropdown
  static const _hospitals = [
    'Ruby Hall Clinic',
    'Sassoon General Hospital',
    'KEM Hospital',
    'Jehangir Hospital',
    'Deenanath Mangeshkar Hospital',
  ];

  String _selectedHospital = 'Ruby Hall Clinic';

  InputDecoration _dec(String hint) => InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(color: _hintColor, fontSize: 15),
    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: _borderColor, width: 1.4),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: _red, width: 1.6),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: _red, width: 1.4),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: _red, width: 1.6),
    ),
  );

  String _initials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.substring(0, 2).toUpperCase();
  }

  void _proceed() {
    if (_formKey.currentState!.validate()) {
      final hospital = HospitalModel(
        name: _selectedHospital,
        city: 'Pune',
        state: 'Maharashtra',
        logoInitials: _initials(_selectedHospital),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => HospitalDashboardScreen(hospital: hospital),
        ),
      );
    }
  }

  @override
  void dispose() {
    _hospitalCtrl.dispose();
    _codeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Hospital Staff Login',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          children: [
            const SizedBox(height: 16),
            // Icon header
            Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xFFFDE8E8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.local_hospital_rounded,
                  color: _red,
                  size: 36,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Welcome, Hospital Staff',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
            const SizedBox(height: 6),
            const Center(
              child: Text(
                'Select your hospital and enter your staff code',
                style: TextStyle(fontSize: 14, color: Color(0xFF888888)),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 36),
            // Hospital selector
            const Text(
              'Hospital',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _selectedHospital,
              decoration: _dec(''),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF1A1A1A),
                size: 22,
              ),
              borderRadius: BorderRadius.circular(16),
              items: _hospitals
                  .map((h) => DropdownMenuItem(value: h, child: Text(h)))
                  .toList(),
              onChanged: (v) =>
                  setState(() => _selectedHospital = v ?? _selectedHospital),
              validator: (v) => v == null ? 'Please select a hospital' : null,
            ),
            const SizedBox(height: 20),
            // Staff code
            const Text(
              'Staff Code',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _codeCtrl,
              obscureText: _obscure,
              decoration: _dec('Enter your staff access code').copyWith(
                suffixIcon: IconButton(
                  onPressed: () => setState(() => _obscure = !_obscure),
                  icon: Icon(
                    _obscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: const Color(0xFFAAAAAA),
                    size: 20,
                  ),
                ),
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Code is required';
                if (v.length < 4) return 'Code must be at least 4 characters';
                return null;
              },
            ),
            const SizedBox(height: 36),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: _proceed,
                icon: const Icon(
                  Icons.login_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                label: const Text(
                  'Continue to Dashboard',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _red,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════
// DONOR GOOGLE SIGN-IN SCREEN
// ══════════════════════════════════════════════════════════════

class DonorGoogleSignInScreen extends StatefulWidget {
  const DonorGoogleSignInScreen({super.key});

  @override
  State<DonorGoogleSignInScreen> createState() =>
      _DonorGoogleSignInScreenState();
}

// ── Sample accounts shown in the picker ────────────────────────────────────
class _MockAccount {
  final String name;
  final String email;
  final Color avatarColor;
  const _MockAccount(this.name, this.email, this.avatarColor);
}

const _mockAccounts = [
  _MockAccount('Aditya Pundlik', 'adipun.2020@gmail.com', Color(0xFF4285F4)),
];

class _DonorGoogleSignInScreenState extends State<DonorGoogleSignInScreen> {
  static const _red = Color(0xFFD32F2F);
  static const _bg = Color(0xFFF7F7F7);

  bool _loading = false;

  // Shows the Google-style "Choose an account" bottom sheet
  Future<void> _handleGoogleSignIn() async {
    final picked = await showModalBottomSheet<_MockAccount?>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const _GoogleAccountPickerSheet(),
    );

    if (picked == null || !mounted) return;

    setState(() => _loading = true);
    // Small artificial delay to mimic network auth
    await Future.delayed(const Duration(milliseconds: 700));

    if (!mounted) return;
    setState(() => _loading = false);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => DonorRegistrationScreen(
          prefillName: picked.name,
          prefillEmail: picked.email,
          googlePhotoUrl: null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF1A1A1A),
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),

                // ── RedLink logo ──────────────────────────────────────────
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Red',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: _red,
                          letterSpacing: 0.5,
                        ),
                      ),
                      TextSpan(
                        text: 'Link',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1A1A1A),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),

                // ── Illustration container ────────────────────────────────
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDE8E8),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: _red.withValues(alpha: 0.12),
                        blurRadius: 30,
                        spreadRadius: 6,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.volunteer_activism_rounded,
                    size: 68,
                    color: _red,
                  ),
                ),

                const SizedBox(height: 36),

                // ── Heading ───────────────────────────────────────────────
                const Text(
                  'Join as a Donor',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1A1A1A),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Sign in with Google to create your\ndonor profile and save lives.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF888888),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 48),

                // ── Benefits tiles ────────────────────────────────────────
                _BenefitTile(
                  icon: Icons.security_rounded,
                  color: const Color(0xFF1565C0),
                  title: 'Secure & Private',
                  subtitle: 'Your data is protected with Google authentication',
                ),
                const SizedBox(height: 12),
                _BenefitTile(
                  icon: Icons.notifications_active_rounded,
                  color: const Color(0xFFF57C00),
                  title: 'Instant Alerts',
                  subtitle:
                  'Get notified when your blood type is needed nearby',
                ),
                const SizedBox(height: 12),
                _BenefitTile(
                  icon: Icons.favorite_rounded,
                  color: _red,
                  title: 'Save Lives',
                  subtitle: 'Every donation can save up to 3 lives',
                ),

                const SizedBox(height: 48),

                // ── Google Sign-In button ─────────────────────────────────
                SizedBox(
                  width: double.infinity,
                  child: _loading
                      ? const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF4285F4),
                      ),
                    ),
                  )
                      : _GoogleSignInButton(onPressed: _handleGoogleSignIn),
                ),

                const SizedBox(height: 16),

                // ── Privacy note ──────────────────────────────────────────
                const Text(
                  'By continuing, you agree to RedLink\'s Terms of Service\nand Privacy Policy.',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFFAAAAAA),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Google Sign-In button with official Google styling ─────────────────────
class _GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _GoogleSignInButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Google "G" logo
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: CustomPaint(painter: _GoogleLogoPainter()),
            ),
            const SizedBox(width: 12),
            const Text(
              'Continue with Google',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF3C4043),
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Benefit tile ────────────────────────────────────────────────────────────
class _BenefitTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;

  const _BenefitTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF888888),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Google-style account picker bottom sheet ────────────────────────────────
class _GoogleAccountPickerSheet extends StatefulWidget {
  const _GoogleAccountPickerSheet();

  @override
  State<_GoogleAccountPickerSheet> createState() =>
      _GoogleAccountPickerSheetState();
}

class _GoogleAccountPickerSheetState extends State<_GoogleAccountPickerSheet> {
  bool _showCustomForm = false;

  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFDDDDDD),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // ── Google header ─────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 4),
            child: Column(
              children: [
                // Google multicolor "G" text
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'G',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF4285F4),
                        ),
                      ),
                      TextSpan(
                        text: 'o',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFEA4335),
                        ),
                      ),
                      TextSpan(
                        text: 'o',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFBBC05),
                        ),
                      ),
                      TextSpan(
                        text: 'g',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF4285F4),
                        ),
                      ),
                      TextSpan(
                        text: 'l',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF34A853),
                        ),
                      ),
                      TextSpan(
                        text: 'e',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFEA4335),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Choose an account',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF202124),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'to continue to RedLink',
                  style: TextStyle(fontSize: 13, color: Color(0xFF5F6368)),
                ),
              ],
            ),
          ),

          const Divider(height: 24, color: Color(0xFFE8EAED)),

          if (!_showCustomForm) ...[
            // ── Sample accounts ───────────────────────────────────────
            ..._mockAccounts.map(
                  (acc) => _AccountTile(
                account: acc,
                onTap: () => Navigator.of(context).pop(acc),
              ),
            ),

            // Divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              child: Divider(color: Color(0xFFE8EAED)),
            ),

            // ── "Use a different account" ─────────────────────────────
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 24),
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFDADCE0), width: 1),
                ),
                child: const Icon(
                  Icons.add_rounded,
                  color: Color(0xFF5F6368),
                  size: 22,
                ),
              ),
              title: const Text(
                'Use a different account',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF202124),
                ),
              ),
              onTap: () => setState(() => _showCustomForm = true),
            ),
          ] else ...[
            // ── Custom name / email form ──────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
              child: Column(
                children: [
                  _SheetField(
                    controller: _nameCtrl,
                    label: 'Full name',
                    icon: Icons.person_outline_rounded,
                  ),
                  const SizedBox(height: 12),
                  _SheetField(
                    controller: _emailCtrl,
                    label: 'Email address',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () =>
                            setState(() => _showCustomForm = false),
                        child: const Text(
                          'Back',
                          style: TextStyle(color: Color(0xFF5F6368)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1A73E8),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        onPressed: () {
                          final name = _nameCtrl.text.trim();
                          final email = _emailCtrl.text.trim();
                          if (name.isEmpty || email.isEmpty) return;
                          Navigator.of(context).pop(
                            _MockAccount(name, email, const Color(0xFF4285F4)),
                          );
                        },
                        child: const Text(
                          'Continue',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],

          // ── Footer ────────────────────────────────────────────────────
          const Divider(color: Color(0xFFE8EAED), height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _FooterLink('Privacy Policy'),
                const SizedBox(width: 6),
                const Text(
                  '·',
                  style: TextStyle(fontSize: 12, color: Color(0xFF80868B)),
                ),
                const SizedBox(width: 6),
                _FooterLink('Terms of Service'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Account row tile ────────────────────────────────────────────────────────
class _AccountTile extends StatelessWidget {
  final _MockAccount account;
  final VoidCallback onTap;

  const _AccountTile({required this.account, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: account.avatarColor,
        child: Text(
          account.name[0],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      title: Text(
        account.name,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF202124),
        ),
      ),
      subtitle: Text(
        account.email,
        style: const TextStyle(fontSize: 12, color: Color(0xFF5F6368)),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: Color(0xFF5F6368),
        size: 20,
      ),
      onTap: onTap,
    );
  }
}

// ── Text field inside the sheet ─────────────────────────────────────────────
class _SheetField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType keyboardType;

  const _SheetField({
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 14, color: Color(0xFF202124)),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 14, color: Color(0xFF5F6368)),
        prefixIcon: Icon(icon, size: 18, color: const Color(0xFF5F6368)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        filled: true,
        fillColor: const Color(0xFFF8F9FA),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFDADCE0), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF1A73E8), width: 1.5),
        ),
      ),
    );
  }
}

// ── Footer link text ────────────────────────────────────────────────────────
class _FooterLink extends StatelessWidget {
  final String text;
  const _FooterLink(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 12, color: Color(0xFF1A73E8)),
    );
  }
}

// ── Google "G" logo painter ─────────────────────────────────────────────────
class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double cx = size.width / 2;
    final double cy = size.height / 2;
    final double r = size.width / 2;

    // Blue arc (top-right)
    _drawArc(
      canvas,
      cx,
      cy,
      r,
      -10 * (3.14159 / 180),
      80 * (3.14159 / 180),
      const Color(0xFF4285F4),
    );
    // Red arc (top-left)
    _drawArc(
      canvas,
      cx,
      cy,
      r,
      190 * (3.14159 / 180),
      80 * (3.14159 / 180),
      const Color(0xFFEA4335),
    );
    // Yellow arc (bottom-left)
    _drawArc(
      canvas,
      cx,
      cy,
      r,
      120 * (3.14159 / 180),
      70 * (3.14159 / 180),
      const Color(0xFFFBBC05),
    );
    // Green arc (bottom)
    _drawArc(
      canvas,
      cx,
      cy,
      r,
      50 * (3.14159 / 180),
      70 * (3.14159 / 180),
      const Color(0xFF34A853),
    );

    // White middle
    final whitePaint = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(cx, cy), r * 0.55, whitePaint);

    // Blue "G" horizontal bar
    final bluePaint = Paint()
      ..color = const Color(0xFF4285F4)
      ..strokeWidth = r * 0.25
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(cx, cy), Offset(cx + r * 0.85, cy), bluePaint);
  }

  void _drawArc(
      Canvas canvas,
      double cx,
      double cy,
      double r,
      double startAngle,
      double sweepAngle,
      Color color,
      ) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = r * 0.32
      ..style = PaintingStyle.stroke;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r * 0.75),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ══════════════════════════════════════════════════════════════
// SOS REQUEST DETAILS SCREEN
// ══════════════════════════════════════════════════════════════

class SosRequestDetailsScreen extends StatelessWidget {
  final BloodBankSosRequest req;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  static const _red = Color(0xFFD32F2F);

  const SosRequestDetailsScreen({
    super.key,
    required this.req,
    required this.onAccept,
    required this.onDecline,
  });

  Color _urgencyColor(SosUrgency u) => u == SosUrgency.critical
      ? _red
      : u == SosUrgency.high
      ? const Color(0xFFF57C00)
      : const Color(0xFF1565C0);

  String _urgencyLabel(SosUrgency u) => u == SosUrgency.critical
      ? 'CRITICAL'
      : u == SosUrgency.high
      ? 'HIGH'
      : 'NORMAL';

  @override
  Widget build(BuildContext context) {
    final urgencyColor = _urgencyColor(req.urgency);
    final point = LatLng(req.lat, req.lng);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Request Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 14),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: urgencyColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: urgencyColor.withValues(alpha: 0.35),
                width: 1,
              ),
            ),
            child: Text(
              _urgencyLabel(req.urgency),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: urgencyColor,
              ),
            ),
          ),
        ],
      ),

      // ── Bottom buttons ────────────────────────────────────────────────────
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(
          20,
          12,
          20,
          MediaQuery.of(context).padding.bottom + 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Accept Request
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () {
                  onAccept();
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.check_circle_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                label: const Text(
                  'Accept Request',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _red,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Decline
            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton(
                onPressed: () {
                  onDecline();
                  Navigator.of(context).pop();
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFDDDDDD), width: 1.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Decline',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF444444),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          // ── Map ───────────────────────────────────────────────────────────
          SizedBox(
            height: 265,
            child: FlutterMap(
              options: MapOptions(
                initialCenter: point,
                initialZoom: 14.5,
                interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                ),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.red_link',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: point,
                      width: 52,
                      height: 52,
                      child: Container(
                        decoration: BoxDecoration(
                          color: _red,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: _red.withValues(alpha: 0.45),
                              blurRadius: 14,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ── Details card (overlaps map by 26px) ───────────────────────────
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: -26),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hospital name
                    Text(
                      req.hospitalName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          size: 15,
                          color: Color(0xFF888888),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          req.location,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF888888),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    const Divider(
                      color: Color(0xFFF0F0F0),
                      thickness: 1,
                      height: 1,
                    ),
                    const SizedBox(height: 22),

                    // ── Info grid ─────────────────────────────────────────
                    Row(
                      children: [
                        Expanded(
                          child: _InfoBox(
                            label: 'BLOOD GROUP',
                            icon: const Icon(
                              Icons.water_drop_rounded,
                              size: 17,
                              color: _red,
                            ),
                            value: req.bloodGroup,
                            valueColor: _red,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: _InfoBox(
                            label: 'UNITS REQUIRED',
                            icon: const Icon(
                              Icons.water_drop_outlined,
                              size: 17,
                              color: Color(0xFF1A1A1A),
                            ),
                            value: '${req.unitsNeeded} Units',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: _InfoBox(
                            label: 'DISTANCE',
                            icon: const Icon(
                              Icons.route_rounded,
                              size: 17,
                              color: Color(0xFF1A1A1A),
                            ),
                            value: req.distance,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: _InfoBox(
                            label: 'TIME LEFT',
                            icon: const Icon(
                              Icons.timer_rounded,
                              size: 17,
                              color: _red,
                            ),
                            value: req.neededIn,
                            valueColor: _red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),

                    // ── Message quote ─────────────────────────────────────
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDE8E8),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        '"${req.message}"',
                        style: const TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF444444),
                          height: 1.6,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Info box ──────────────────────────────────────────────────────────────
class _InfoBox extends StatelessWidget {
  final String label;
  final Widget icon;
  final String value;
  final Color valueColor;

  const _InfoBox({
    required this.label,
    required this.icon,
    required this.value,
    this.valueColor = const Color(0xFF1A1A1A),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F4F7),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Color(0xFF888888),
              letterSpacing: 0.6,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              icon,
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: valueColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════
// BLOOD BANK DASHBOARD SCREEN
// ══════════════════════════════════════════════════════════════

class BloodBankDashboardScreen extends StatefulWidget {
  final BloodBankModel bank;
  const BloodBankDashboardScreen({super.key, required this.bank});

  @override
  State<BloodBankDashboardScreen> createState() =>
      _BloodBankDashboardScreenState();
}

class _BloodBankDashboardScreenState extends State<BloodBankDashboardScreen> {
  static const _red = Color(0xFFD32F2F);
  static const _bg = Color(0xFFF7F7F7);

  int _tab = 2; // start on Inventory tab (matches reference)

  // Mutable inventory copy
  late Map<String, int> _inventory;

  // SOS requests
  late List<BloodBankSosRequest> _sosRequests;

  @override
  void initState() {
    super.initState();
    _inventory = Map<String, int>.from(widget.bank.inventory);
    _sosRequests = [
      BloodBankSosRequest(
        id: 'sos_001',
        hospitalName: 'Ruby Hall Clinic',
        location: 'Shivajinagar, Pune',
        bloodGroup: 'O−',
        unitsNeeded: 3,
        neededIn: '30 min',
        distance: '2.4 km',
        message:
        'Critical patient in ICU post-surgery. O-negative urgently required for transfusion.',
        lat: 18.5314,
        lng: 73.8446,
        urgency: SosUrgency.critical,
      ),
      BloodBankSosRequest(
        id: 'sos_002',
        hospitalName: 'Sassoon General Hospital',
        location: 'Camp, Pune',
        bloodGroup: 'A−',
        unitsNeeded: 2,
        neededIn: '1 hr',
        distance: '3.8 km',
        message:
        'Emergency surgery case. Need blood urgently. Please reach out if you can help.',
        lat: 18.5167,
        lng: 73.8567,
        urgency: SosUrgency.high,
      ),
      BloodBankSosRequest(
        id: 'sos_003',
        hospitalName: 'KEM Hospital',
        location: 'Rasta Peth, Pune',
        bloodGroup: 'B+',
        unitsNeeded: 5,
        neededIn: '2 hrs',
        distance: '5.1 km',
        message:
        'Accident victim in emergency ward. B+ blood required for immediate transfusion.',
        lat: 18.5308,
        lng: 73.8631,
        urgency: SosUrgency.normal,
      ),
    ];
  }

  // ── Status helpers ────────────────────────────────────────────────────────
  _StockStatus _statusOf(int units) {
    if (units <= 5) return _StockStatus.critical;
    if (units <= 30) return _StockStatus.low;
    return _StockStatus.good;
  }

  int get _criticalCount => _inventory.values
      .where((v) => _statusOf(v) == _StockStatus.critical)
      .length;

  int get _sosActive =>
      _sosRequests.where((s) => !s.isResponded && !s.isRejected).length;

  // ── Update inventory dialog ───────────────────────────────────────────────
  void _showUpdateDialog(String bloodGroup, int current) {
    final ctrl = TextEditingController(text: current.toString());
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFFDE8E8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                bloodGroup,
                style: const TextStyle(
                  color: _red,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Update Units',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        content: TextField(
          controller: ctrl,
          keyboardType: TextInputType.number,
          autofocus: true,
          decoration: InputDecoration(
            labelText: 'Available units',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: _red, width: 1.6),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Color(0xFF888888)),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: _red,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              final val = int.tryParse(ctrl.text.trim());
              if (val != null && val >= 0) {
                setState(() => _inventory[bloodGroup] = val);
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  // ── Open SOS request details screen ─────────────────────────────────────
  void _openSosDetails(BloodBankSosRequest req) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SosRequestDetailsScreen(
          req: req,
          onAccept: () {
            setState(() {
              req.isResponded = true;
              final cur = _inventory[req.bloodGroup] ?? 0;
              _inventory[req.bloodGroup] = (cur - req.unitsNeeded).clamp(
                0,
                9999,
              );
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Dispatched ${req.unitsNeeded} units of ${req.bloodGroup} to ${req.hospitalName}',
                ),
                backgroundColor: const Color(0xFF2E7D32),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
          onDecline: () => setState(() => req.isRejected = true),
        ),
      ),
    );
  }

  void _rejectSos(BloodBankSosRequest req) =>
      setState(() => req.isRejected = true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'RedLink Dashboard',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Color(0xFF1A1A1A),
                ),
                onPressed: () {},
              ),
              if (_sosActive > 0)
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: _red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: IndexedStack(
        index: _tab,
        children: [
          _HomeTab(
            bank: widget.bank,
            inventory: _inventory,
            sosRequests: _sosRequests,
            criticalCount: _criticalCount,
            sosActive: _sosActive,
            onUpdateInventory: () => setState(() => _tab = 2),
            onRespondSos: () => setState(() => _tab = 1),
          ),
          _SosTab(
            sosRequests: _sosRequests,
            onRespond: _openSosDetails,
            onReject: _rejectSos,
          ),
          _InventoryTab(
            bank: widget.bank,
            inventory: _inventory,
            statusOf: _statusOf,
            onUpdate: _showUpdateDialog,
          ),
          _ProfileTab(bank: widget.bank),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 16,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  selected: _tab == 0,
                  onTap: () => setState(() => _tab = 0),
                ),
                _NavItem(
                  icon: Icons.emergency_rounded,
                  label: 'SOS',
                  selected: _tab == 1,
                  badge: _sosActive,
                  onTap: () => setState(() => _tab = 1),
                ),
                _NavItem(
                  icon: Icons.inventory_2_rounded,
                  label: 'Inventory',
                  selected: _tab == 2,
                  highlighted: true,
                  onTap: () => setState(() => _tab = 2),
                ),
                _NavItem(
                  icon: Icons.person_rounded,
                  label: 'Profile',
                  selected: _tab == 3,
                  onTap: () => setState(() => _tab = 3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Home Tab ──────────────────────────────────────────────────────────────
class _HomeTab extends StatelessWidget {
  final BloodBankModel bank;
  final Map<String, int> inventory;
  final List<BloodBankSosRequest> sosRequests;
  final int criticalCount;
  final int sosActive;
  final VoidCallback onUpdateInventory;
  final VoidCallback onRespondSos;

  static const _red = Color(0xFFD32F2F);

  const _HomeTab({
    required this.bank,
    required this.inventory,
    required this.sosRequests,
    required this.criticalCount,
    required this.sosActive,
    required this.onUpdateInventory,
    required this.onRespondSos,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
      children: [
        // ── Quick action buttons ──────────────────────────────────────
        Row(
          children: [
            Expanded(
              child: _QuickActionBtn(
                label: 'Update Invent...',
                icon: Icons.edit_rounded,
                filled: true,
                onTap: onUpdateInventory,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _QuickActionBtn(
                label: 'Respond to SOS',
                icon: Icons.emergency_rounded,
                filled: false,
                onTap: onRespondSos,
              ),
            ),
          ],
        ),

        const SizedBox(height: 28),

        // ── Inventory overview header ─────────────────────────────────
        Row(
          children: [
            const Expanded(
              child: Text(
                'Inventory Overview',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
            Text(
              bank.name,
              style: const TextStyle(fontSize: 12, color: Color(0xFF888888)),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // ── Blood group grid (2 columns) ──────────────────────────────
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 1.2,
          children: inventory.entries.map((e) {
            final units = e.value;
            final status = units <= 5
                ? _StockStatus.critical
                : units <= 30
                ? _StockStatus.low
                : _StockStatus.good;
            return _InventoryCard(
              bloodGroup: e.key,
              units: units,
              status: status,
              onTap: null,
            );
          }).toList(),
        ),

        const SizedBox(height: 28),

        // ── Stats row ─────────────────────────────────────────────────
        Row(
          children: [
            _StatChip(
              label: 'Critical',
              value: criticalCount.toString(),
              color: _red,
              icon: Icons.error_rounded,
            ),
            const SizedBox(width: 10),
            _StatChip(
              label: 'SOS Active',
              value: sosActive.toString(),
              color: const Color(0xFFF57C00),
              icon: Icons.emergency_rounded,
            ),
            const SizedBox(width: 10),
            _StatChip(
              label: 'Total Groups',
              value: inventory.length.toString(),
              color: const Color(0xFF1565C0),
              icon: Icons.water_drop_rounded,
            ),
          ],
        ),
      ],
    );
  }
}

// ── SOS Tab ───────────────────────────────────────────────────────────────
class _SosTab extends StatelessWidget {
  final List<BloodBankSosRequest> sosRequests;
  final void Function(BloodBankSosRequest) onRespond;
  final void Function(BloodBankSosRequest) onReject;

  const _SosTab({
    required this.sosRequests,
    required this.onRespond,
    required this.onReject,
  });

  static const _red = Color(0xFFD32F2F);

  Color _urgencyColor(SosUrgency u) => u == SosUrgency.critical
      ? _red
      : u == SosUrgency.high
      ? const Color(0xFFF57C00)
      : const Color(0xFF1565C0);

  String _urgencyLabel(SosUrgency u) => u == SosUrgency.critical
      ? 'CRITICAL'
      : u == SosUrgency.high
      ? 'HIGH'
      : 'NORMAL';

  @override
  Widget build(BuildContext context) {
    final active = sosRequests
        .where((s) => !s.isResponded && !s.isRejected)
        .toList();
    final dispatched = sosRequests.where((s) => s.isResponded).toList();
    final rejected = sosRequests.where((s) => s.isRejected).toList();

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'SOS Requests',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
            if (active.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDE8E8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${active.length} Active',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: _red,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
        if (active.isEmpty && dispatched.isEmpty && rejected.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 60),
              child: Text(
                'No SOS requests at this time.',
                style: TextStyle(fontSize: 15, color: Color(0xFF888888)),
              ),
            ),
          )
        else ...[
          if (active.isNotEmpty)
            ...active.map(
                  (req) => _SosCard(
                req: req,
                urgencyColor: _urgencyColor(req.urgency),
                urgencyLabel: _urgencyLabel(req.urgency),
                onRespond: () => onRespond(req),
                onReject: () => onReject(req),
              ),
            ),
          if (dispatched.isNotEmpty) ...[
            const SizedBox(height: 8),
            const Text(
              'Dispatched',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 10),
            ...dispatched.map(
                  (req) => Opacity(
                opacity: 0.55,
                child: _SosCard(
                  req: req,
                  urgencyColor: const Color(0xFF2E7D32),
                  urgencyLabel: 'DISPATCHED',
                  onRespond: null,
                  onReject: null,
                ),
              ),
            ),
          ],
          if (rejected.isNotEmpty) ...[
            const SizedBox(height: 8),
            const Text(
              'Rejected',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF9E9E9E),
              ),
            ),
            const SizedBox(height: 10),
            ...rejected.map(
                  (req) => Opacity(
                opacity: 0.45,
                child: _SosCard(
                  req: req,
                  urgencyColor: const Color(0xFF9E9E9E),
                  urgencyLabel: 'REJECTED',
                  onRespond: null,
                  onReject: null,
                ),
              ),
            ),
          ],
        ],
      ],
    );
  }
}

// ── Inventory Tab ─────────────────────────────────────────────────────────
class _InventoryTab extends StatelessWidget {
  final BloodBankModel bank;
  final Map<String, int> inventory;
  final _StockStatus Function(int) statusOf;
  final void Function(String, int) onUpdate;

  static const _red = Color(0xFFD32F2F);

  const _InventoryTab({
    required this.bank,
    required this.inventory,
    required this.statusOf,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Inventory Overview',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  Text(
                    bank.name,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF888888),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Show update dialog for first critical group, or A+
                final first = inventory.entries.first;
                onUpdate(first.key, first.value);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: _red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.edit_rounded, color: Colors.white, size: 14),
                    SizedBox(width: 6),
                    Text(
                      'Update',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 1.2,
          children: inventory.entries.map((e) {
            final status = statusOf(e.value);
            return _InventoryCard(
              bloodGroup: e.key,
              units: e.value,
              status: status,
              onTap: () => onUpdate(e.key, e.value),
            );
          }).toList(),
        ),

        const SizedBox(height: 20),

        // ── Legend ────────────────────────────────────────────────────
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Stock Level Guide',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 10),
              _LegendRow(
                color: const Color(0xFF2E7D32),
                icon: Icons.check_circle_rounded,
                label: 'Good  (> 30 units)',
              ),
              const SizedBox(height: 6),
              _LegendRow(
                color: const Color(0xFFF57C00),
                icon: Icons.warning_rounded,
                label: 'Low  (6 – 30 units)',
              ),
              const SizedBox(height: 6),
              _LegendRow(
                color: _red,
                icon: Icons.error_rounded,
                label: 'Critical  (≤ 5 units)',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Profile Tab ───────────────────────────────────────────────────────────
class _ProfileTab extends StatelessWidget {
  final BloodBankModel bank;
  static const _red = Color(0xFFD32F2F);

  const _ProfileTab({required this.bank});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 28),
      children: [
        Center(
          child: Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: Color(0xFFFDE8E8),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                bank.logoInitials,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: _red,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 14),
        Center(
          child: Text(
            bank.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ),
        Center(
          child: Text(
            '${bank.city}, ${bank.state}',
            style: const TextStyle(fontSize: 13, color: Color(0xFF888888)),
          ),
        ),
        const SizedBox(height: 28),
        _InfoTile(
          icon: Icons.water_drop_rounded,
          label: 'Type',
          value: 'Blood Bank',
        ),
        _InfoTile(
          icon: Icons.location_city_rounded,
          label: 'City',
          value: bank.city,
        ),
        _InfoTile(icon: Icons.map_rounded, label: 'State', value: bank.state),
        _InfoTile(
          icon: Icons.verified_rounded,
          label: 'License',
          value: 'BB-MH-${bank.logoInitials}-2024',
        ),
        const SizedBox(height: 24),
        OutlinedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.logout_rounded, size: 18, color: _red),
          label: const Text(
            'Sign Out',
            style: TextStyle(color: _red, fontWeight: FontWeight.w600),
          ),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: _red, width: 1.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ],
    );
  }
}

// ════════════════── Shared small widgets ══════════════════════════════════

enum _StockStatus { good, low, critical }

class _InventoryCard extends StatelessWidget {
  final String bloodGroup;
  final int units;
  final _StockStatus status;
  final VoidCallback? onTap;

  static const _red = Color(0xFFD32F2F);

  const _InventoryCard({
    required this.bloodGroup,
    required this.units,
    required this.status,
    required this.onTap,
  });

  Color get _bgCircle => status == _StockStatus.good
      ? const Color(0xFFE8F5E9)
      : status == _StockStatus.low
      ? const Color(0xFFFFF3E0)
      : const Color(0xFFFDE8E8);

  Color get _iconColor => status == _StockStatus.good
      ? const Color(0xFF2E7D32)
      : status == _StockStatus.low
      ? const Color(0xFFF57C00)
      : _red;

  IconData get _icon => status == _StockStatus.good
      ? Icons.check_circle_rounded
      : status == _StockStatus.low
      ? Icons.warning_rounded
      : Icons.error_rounded;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background circle
            Positioned(
              top: -10,
              right: -10,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: _bgCircle,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Status icon
            Positioned(
              top: 0,
              right: 0,
              child: Icon(_icon, color: _iconColor, size: 20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  bloodGroup,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Available Units',
                  style: TextStyle(fontSize: 12, color: Color(0xFF888888)),
                ),
                Text(
                  units.toString(),
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: status == _StockStatus.critical
                        ? _red
                        : const Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SosCard extends StatelessWidget {
  final BloodBankSosRequest req;
  final Color urgencyColor;
  final String urgencyLabel;
  final VoidCallback? onRespond;
  final VoidCallback? onReject;

  static const _red = Color(0xFFD32F2F);

  const _SosCard({
    required this.req,
    required this.urgencyColor,
    required this.urgencyLabel,
    required this.onRespond,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: urgencyColor.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDE8E8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  req.bloodGroup,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: _red,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  req.hospitalName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: urgencyColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: urgencyColor.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  urgencyLabel,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: urgencyColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.water_drop_outlined, size: 13, color: urgencyColor),
              const SizedBox(width: 4),
              Text(
                '${req.unitsNeeded} units needed',
                style: const TextStyle(fontSize: 12, color: Color(0xFF444444)),
              ),
              const SizedBox(width: 14),
              const Icon(
                Icons.schedule_rounded,
                size: 13,
                color: Color(0xFFAAAAAA),
              ),
              const SizedBox(width: 4),
              Text(
                'Within ${req.neededIn}',
                style: const TextStyle(fontSize: 12, color: Color(0xFF888888)),
              ),
            ],
          ),
          if (onRespond != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                // Reject
                Expanded(
                  child: OutlinedButton(
                    onPressed: onReject,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color(0xFFDDDDDD),
                        width: 1.4,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text(
                      'Reject',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Respond & Dispatch
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: onRespond,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: urgencyColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text(
                      'Respond & Dispatch',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _QuickActionBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool filled;
  final VoidCallback onTap;

  static const _red = Color(0xFFD32F2F);

  const _QuickActionBtn({
    required this.label,
    required this.icon,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: filled ? _red : const Color(0xFFFDE8E8),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: filled ? Colors.white : _red, size: 18),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: filled ? Colors.white : _red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final IconData icon;

  const _StatChip({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.2), width: 1),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 10, color: Color(0xFF888888)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final bool highlighted;
  final int badge;
  final VoidCallback onTap;

  static const _red = Color(0xFFD32F2F);

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
    this.highlighted = false,
    this.badge = 0,
  });

  @override
  Widget build(BuildContext context) {
    if (highlighted) {
      // Centre pill (Inventory)
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: selected ? _red : const Color(0xFFFDE8E8),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: selected ? Colors.white : _red, size: 28),
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 64,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Icon(
                  icon,
                  color: selected ? _red : const Color(0xFF9E9E9E),
                  size: 24,
                ),
                if (badge > 0)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: _red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: selected ? _red : const Color(0xFF9E9E9E),
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  static const _red = Color(0xFFD32F2F);

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFFDE8E8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: _red, size: 18),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 11, color: Color(0xFF888888)),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LegendRow extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;

  const _LegendRow({
    required this.color,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Color(0xFF444444)),
        ),
      ],
    );
  }
}

// ══════════════════════════════════════════════════════════════
// HOSPITAL DASHBOARD SCREEN
// ══════════════════════════════════════════════════════════════

class HospitalDashboardScreen extends StatefulWidget {
  final HospitalModel hospital;
  const HospitalDashboardScreen({super.key, required this.hospital});

  @override
  State<HospitalDashboardScreen> createState() =>
      _HospitalDashboardScreenState();
}

class _HospitalDashboardScreenState extends State<HospitalDashboardScreen> {
  int _currentTab = 0;

  static const _red = Color(0xFFD32F2F);
  static const _bg = Color(0xFFF7F7F7);

  // ── Live mutable request list ─────────────────────────────────────────
  final List<HospitalBloodRequest> _requests = [
    HospitalBloodRequest(
      id: 'req_001',
      bloodGroup: 'O+',
      reason: 'Emergency Operation',
      neededIn: 'Needed in 2 Hours',
      unitsRequired: 3,
      donorsResponding: 4,
      progressPercent: 0.66,
      urgency: HospitalRequestUrgency.emergency,
    ),
    HospitalBloodRequest(
      id: 'req_002',
      bloodGroup: 'B−',
      reason: 'Accident Victim',
      neededIn: 'Needed in 4 Hours',
      unitsRequired: 2,
      donorsResponding: 1,
      progressPercent: 0.20,
      urgency: HospitalRequestUrgency.high,
    ),
    HospitalBloodRequest(
      id: 'req_003',
      bloodGroup: 'A+',
      reason: 'Scheduled Surgery',
      neededIn: 'Needed Tomorrow',
      unitsRequired: 1,
      donorsResponding: 1,
      progressPercent: 0.50,
      urgency: HospitalRequestUrgency.normal,
    ),
  ];

  // ── Donor responses (simulates donors who accepted requests) ─────────
  final List<DonorResponse> _donorResponses = [
    DonorResponse(
      id: 'dr_001',
      donorName: 'Rahul Sharma',
      bloodGroup: 'O+',
      distance: '1.2 km away',
      phone: '+91 98765 43210',
      requestId: 'req_001',
      requestReason: 'Emergency Operation',
    ),
    DonorResponse(
      id: 'dr_002',
      donorName: 'Kavita Rao',
      bloodGroup: 'O+',
      distance: '2.0 km away',
      phone: '+91 91234 56789',
      requestId: 'req_001',
      requestReason: 'Emergency Operation',
    ),
    DonorResponse(
      id: 'dr_003',
      donorName: 'Aditya Patil',
      bloodGroup: 'O+',
      distance: '3.5 km away',
      phone: '+91 70000 11111',
      requestId: 'req_001',
      requestReason: 'Emergency Operation',
    ),
    DonorResponse(
      id: 'dr_004',
      donorName: 'Meera Desai',
      bloodGroup: 'O+',
      distance: '6.2 km away',
      phone: '+91 88888 22222',
      requestId: 'req_001',
      requestReason: 'Emergency Operation',
    ),
    DonorResponse(
      id: 'dr_005',
      donorName: 'Priya Joshi',
      bloodGroup: 'B−',
      distance: '2.8 km away',
      phone: '+91 99999 33333',
      requestId: 'req_002',
      requestReason: 'Accident Victim',
    ),
  ];

  // ── Nearby blood banks ────────────────────────────────────────────────
  static final List<NearbyBloodBank> _bloodBanks = [
    NearbyBloodBank(
      name: 'Jehangir Blood Bank',
      distance: '1.2 km away',
      availableUnits: {'A+': 4, 'B+': 2, 'O+': 6},
    ),
    NearbyBloodBank(
      name: 'Sassoon General',
      distance: '2.5 km away',
      availableUnits: {'A−': 1, 'O−': 3},
    ),
    NearbyBloodBank(
      name: 'KEM Blood Centre',
      distance: '3.8 km away',
      availableUnits: {'B+': 5, 'AB+': 2, 'O+': 4},
    ),
    NearbyBloodBank(
      name: 'Ruby Hall Reserve',
      distance: '0.5 km away',
      availableUnits: {'A+': 3, 'AB−': 1},
    ),
  ];

  // ── Computed stats ────────────────────────────────────────────────────
  int get _activeSOS => _requests
      .where(
        (r) => !r.isCancelled && r.urgency == HospitalRequestUrgency.emergency,
  )
      .length;

  int get _totalDonors => _donorResponses
      .where((d) => d.status != DonorResponseStatus.denied)
      .length;

  int get _unitsPending => _requests
      .where((r) => !r.isCancelled)
      .fold(0, (s, r) => s + r.unitsRequired);

  // ── Cancel request ────────────────────────────────────────────────────
  void _cancelRequest(HospitalBloodRequest req) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Cancel Request',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        content: Text(
          'Cancel the ${req.bloodGroup} request for "${req.reason}"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() => req.isCancelled = true);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Request cancelled.'),
                  backgroundColor: Colors.grey[700],
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.all(16),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text('Yes, Cancel'),
          ),
        ],
      ),
    );
  }

  // ── View request details sheet ─────────────────────────────────────────
  void _viewDetails(HospitalBloodRequest req) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFDDDDDD),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _bloodGroupBadge(req.bloodGroup, size: 56),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        req.reason,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        req.neededIn,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF888888),
                        ),
                      ),
                    ],
                  ),
                ),
                _urgencyBadge(req.urgency),
              ],
            ),
            const SizedBox(height: 20),
            _detailTile(
              Icons.water_drop_rounded,
              'Units Required',
              '${req.unitsRequired} units',
              _red,
            ),
            _detailTile(
              Icons.people_rounded,
              'Donors Responding',
              '${req.donorsResponding} donors',
              const Color(0xFF1565C0),
            ),
            _detailTile(
              Icons.trending_up_rounded,
              'Fulfillment',
              '${(req.progressPercent * 100).toInt()}%',
              const Color(0xFF2E7D32),
            ),
            _detailTile(
              Icons.local_hospital_rounded,
              'Hospital',
              widget.hospital.name,
              const Color(0xFF6A1B9A),
            ),
            const SizedBox(height: 8),
            // Progress
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: req.progressPercent,
                backgroundColor: const Color(0xFFEEEEEE),
                color: _red,
                minHeight: 8,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _cancelRequest(req);
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFDDDDDD)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'Cancel Request',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _red,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'Close',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailTile(IconData icon, String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 18, color: color),
          ),
          const SizedBox(width: 12),
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF888888),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    );
  }

  // ── New Emergency Request bottom sheet ────────────────────────────────
  void _newEmergencyRequest() {
    final reasonCtrl = TextEditingController();
    String? selectedGroup;
    int units = 1;
    HospitalRequestUrgency urgency = HospitalRequestUrgency.emergency;

    const bloodGroups = ['A+', 'A−', 'B+', 'B−', 'AB+', 'AB−', 'O+', 'O−'];

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheetState) => Padding(
          padding: EdgeInsets.fromLTRB(
            24,
            16,
            24,
            MediaQuery.of(ctx).viewInsets.bottom + 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDDDDDD),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'New Emergency Blood Request',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 20),
                // Reason
                _sheetLabel('Reason / Diagnosis'),
                TextField(
                  controller: reasonCtrl,
                  decoration: _sheetDecoration(
                    hint: 'e.g. Emergency Operation',
                  ),
                ),
                const SizedBox(height: 16),
                // Blood group
                _sheetLabel('Blood Group Required'),
                DropdownButtonFormField<String>(
                  initialValue: selectedGroup,
                  decoration: _sheetDecoration(hint: ''),
                  hint: const Text(
                    'Select blood group',
                    style: TextStyle(color: Color(0xFFBBBBBB), fontSize: 15),
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF1A1A1A),
                  ),
                  borderRadius: BorderRadius.circular(16),
                  items: bloodGroups
                      .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                      .toList(),
                  onChanged: (v) => setSheetState(() => selectedGroup = v),
                ),
                const SizedBox(height: 16),
                // Units
                _sheetLabel('Units Required'),
                Row(
                  children: [
                    _counterBtn(Icons.remove, () {
                      if (units > 1) setSheetState(() => units--);
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '$units',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                    ),
                    _counterBtn(Icons.add, () => setSheetState(() => units++)),
                  ],
                ),
                const SizedBox(height: 16),
                // Urgency
                _sheetLabel('Urgency Level'),
                Row(
                  children: HospitalRequestUrgency.values.map((u) {
                    final selected = urgency == u;
                    final label = u == HospitalRequestUrgency.emergency
                        ? 'Emergency'
                        : u == HospitalRequestUrgency.high
                        ? 'High'
                        : 'Normal';
                    final color = u == HospitalRequestUrgency.emergency
                        ? _red
                        : u == HospitalRequestUrgency.high
                        ? const Color(0xFFF57C00)
                        : const Color(0xFF757575);
                    return GestureDetector(
                      onTap: () => setSheetState(() => urgency = u),
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? color.withValues(alpha: 0.12)
                              : const Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: selected ? color : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          label,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: selected ? color : const Color(0xFF888888),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (selectedGroup == null ||
                          reasonCtrl.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill all fields.'),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        return;
                      }
                      final newReq = HospitalBloodRequest(
                        id: 'req_${DateTime.now().millisecondsSinceEpoch}',
                        bloodGroup: selectedGroup!,
                        reason: reasonCtrl.text.trim(),
                        neededIn: 'Needed ASAP',
                        unitsRequired: units,
                        donorsResponding: 0,
                        progressPercent: 0,
                        urgency: urgency,
                      );
                      setState(() => _requests.insert(0, newReq));
                      Navigator.pop(ctx);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Colors.white,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Emergency request for $selectedGroup sent!',
                              ),
                            ],
                          ),
                          backgroundColor: _red,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.all(16),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                      size: 20,
                    ),
                    label: const Text(
                      'Send Request',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _red,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _counterBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 18, color: const Color(0xFF1A1A1A)),
      ),
    );
  }

  Widget _sheetLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1A1A1A),
      ),
    ),
  );

  InputDecoration _sheetDecoration({String hint = ''}) => InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(color: Color(0xFFBBBBBB), fontSize: 15),
    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
    filled: true,
    fillColor: const Color(0xFFF7F7F7),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1.2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: _red, width: 1.6),
    ),
  );

  // ── Notifications ─────────────────────────────────────────────────────
  void _showNotifications() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      backgroundColor: Colors.white,
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFDDDDDD),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Notifications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            _notifRow(
              Icons.warning_amber_rounded,
              _red,
              'O+ SOS: 4 donors are now responding.',
              '2 min ago',
            ),
            _notifRow(
              Icons.water_drop,
              const Color(0xFF1565C0),
              'Jehangir Blood Bank has 6 units of O+ available.',
              '15 min ago',
            ),
            _notifRow(
              Icons.person_add_rounded,
              const Color(0xFF2E7D32),
              'New donor registered matching B− requirement.',
              '1 hr ago',
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _notifRow(
      IconData icon,
      Color color,
      String msg,
      String time,
      ) => Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 18, color: color),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                msg,
                style: const TextStyle(fontSize: 13, color: Color(0xFF1A1A1A)),
              ),
              const SizedBox(height: 2),
              Text(
                time,
                style: const TextStyle(fontSize: 11, color: Color(0xFFAAAAAA)),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  // ── Helpers ───────────────────────────────────────────────────────────
  Widget _bloodGroupBadge(String group, {double size = 50}) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: const Color(0xFFFDE8E8),
      borderRadius: BorderRadius.circular(size * 0.28),
    ),
    alignment: Alignment.center,
    child: Text(
      group,
      style: TextStyle(
        fontSize: size * 0.28,
        fontWeight: FontWeight.w800,
        color: _red,
      ),
    ),
  );

  Widget _urgencyBadge(HospitalRequestUrgency urgency) {
    final label = urgency == HospitalRequestUrgency.emergency
        ? 'EMERGENCY'
        : urgency == HospitalRequestUrgency.high
        ? 'HIGH'
        : 'NORMAL';
    final color = urgency == HospitalRequestUrgency.emergency
        ? _red
        : urgency == HospitalRequestUrgency.high
        ? const Color(0xFFF57C00)
        : const Color(0xFF757575);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: color,
          letterSpacing: 0.3,
        ),
      ),
    );
  }

  // ── Main build ────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final activeRequests = _requests.where((r) => !r.isCancelled).toList();

    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 16,
        title: Row(
          children: [
            // Hospital avatar
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFFDE8E8),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFFFCDD2), width: 2),
              ),
              alignment: Alignment.center,
              child: Text(
                widget.hospital.logoInitials,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: _red,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.hospital.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFDE8E8),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'STAFF',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: _red,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${widget.hospital.city}, ${widget.hospital.state}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFAAAAAA),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: _showNotifications,
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                color: Color(0xFFF2F2F2),
                shape: BoxShape.circle,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.notifications_outlined,
                    color: Color(0xFF1A1A1A),
                    size: 22,
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: _red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentTab,
        children: [
          _DashboardTab(
            activeSOS: _activeSOS,
            totalDonors: _totalDonors,
            bloodBanksCount: _bloodBanks.length,
            unitsPending: _unitsPending,
            activeRequests: activeRequests,
            bloodBanks: _bloodBanks,
            onNewRequest: _newEmergencyRequest,
            onCancel: _cancelRequest,
            onViewDetails: _viewDetails,
            bloodGroupBadge: _bloodGroupBadge,
            urgencyBadge: _urgencyBadge,
          ),
          _RequestsTab(
            requests: _requests,
            onCancel: _cancelRequest,
            onViewDetails: _viewDetails,
            bloodGroupBadge: _bloodGroupBadge,
            urgencyBadge: _urgencyBadge,
            onNewRequest: _newEmergencyRequest,
          ),
          _DonorsTab(
            donorResponses: _donorResponses,
            onAccept: (dr) =>
                setState(() => dr.status = DonorResponseStatus.accepted),
            onDeny: (dr) =>
                setState(() => dr.status = DonorResponseStatus.denied),
          ),
          _HospitalProfileTab(hospital: widget.hospital),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentTab,
          onTap: (i) => setState(() => _currentTab = i),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: _red,
          unselectedItemColor: const Color(0xFF9E9E9E),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 11,
          ),
          unselectedLabelStyle: const TextStyle(fontSize: 11),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_rounded),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded),
              label: 'Requests',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_rounded),
              label: 'Donors',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
//  Dashboard Tab
// ════════════════════════════════════════════════════════════
class _DashboardTab extends StatelessWidget {
  final int activeSOS;
  final int totalDonors;
  final int bloodBanksCount;
  final int unitsPending;
  final List<HospitalBloodRequest> activeRequests;
  final List<NearbyBloodBank> bloodBanks;
  final VoidCallback onNewRequest;
  final void Function(HospitalBloodRequest) onCancel;
  final void Function(HospitalBloodRequest) onViewDetails;
  final Widget Function(String, {double size}) bloodGroupBadge;
  final Widget Function(HospitalRequestUrgency) urgencyBadge;

  static const _red = Color(0xFFD32F2F);

  const _DashboardTab({
    required this.activeSOS,
    required this.totalDonors,
    required this.bloodBanksCount,
    required this.unitsPending,
    required this.activeRequests,
    required this.bloodBanks,
    required this.onNewRequest,
    required this.onCancel,
    required this.onViewDetails,
    required this.bloodGroupBadge,
    required this.urgencyBadge,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      children: [
        // ── Stats grid ───────────────────────────────────────────────
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 1.55,
          children: [
            _StatCard(
              icon: Icons.warning_amber_rounded,
              iconColor: _red,
              value: '$activeSOS',
              label: 'Active SOS',
            ),
            _StatCard(
              icon: Icons.people_rounded,
              iconColor: const Color(0xFF1A1A1A),
              value: '$totalDonors',
              label: 'Donors',
            ),
            _StatCard(
              icon: Icons.local_hospital_rounded,
              iconColor: const Color(0xFF1A1A1A),
              value: '$bloodBanksCount',
              label: 'Blood Banks',
            ),
            _StatCard(
              icon: Icons.water_drop_rounded,
              iconColor: const Color(0xFF1A1A1A),
              value: '$unitsPending',
              label: 'Units Pending',
            ),
          ],
        ),

        const SizedBox(height: 20),

        // ── New Emergency Button ─────────────────────────────────────
        GestureDetector(
          onTap: onNewRequest,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFE53935), Color(0xFFC62828)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: _red.withValues(alpha: 0.35),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_circle_outline, color: Colors.white, size: 22),
                SizedBox(width: 10),
                Text(
                  'New Emergency Blood Request',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 28),

        // ── Active Requests ──────────────────────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Active Requests',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A1A),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'See All',
                style: TextStyle(
                  fontSize: 14,
                  color: _red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        if (activeRequests.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                'No active requests.',
                style: TextStyle(color: Colors.grey[500], fontSize: 14),
              ),
            ),
          )
        else
          ...activeRequests.map(
                (r) => _ActiveRequestCard(
              request: r,
              onCancel: () => onCancel(r),
              onViewDetails: () => onViewDetails(r),
              bloodGroupBadge: bloodGroupBadge,
              urgencyBadge: urgencyBadge,
            ),
          ),

        const SizedBox(height: 12),

        // ── Nearby Blood Banks ───────────────────────────────────────
        const Text(
          'Nearby Blood Banks',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
          ),
        ),

        const SizedBox(height: 14),

        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bloodBanks.length,
            itemBuilder: (_, i) => _BloodBankCard(bank: bloodBanks[i]),
          ),
        ),

        const SizedBox(height: 28),
      ],
    );
  }
}

// ── Stat card ──────────────────────────────────────────────────────────────
class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: iconColor, size: 24),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF888888),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Active request card ────────────────────────────────────────────────────
class _ActiveRequestCard extends StatelessWidget {
  final HospitalBloodRequest request;
  final VoidCallback onCancel;
  final VoidCallback onViewDetails;
  final Widget Function(String, {double size}) bloodGroupBadge;
  final Widget Function(HospitalRequestUrgency) urgencyBadge;

  static const _red = Color(0xFFD32F2F);

  const _ActiveRequestCard({
    required this.request,
    required this.onCancel,
    required this.onViewDetails,
    required this.bloodGroupBadge,
    required this.urgencyBadge,
  });

  @override
  Widget build(BuildContext context) {
    final pct = (request.progressPercent * 100).toInt();
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row
            Row(
              children: [
                bloodGroupBadge(request.bloodGroup),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request.reason,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        request.neededIn,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF888888),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDE8E8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${request.unitsRequired} Units',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: _red,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            // Status + percent
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status: ${request.donorsResponding} Donor${request.donorsResponding == 1 ? '' : 's'} Responding',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF888888),
                  ),
                ),
                Text(
                  '$pct%',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: request.progressPercent,
                backgroundColor: const Color(0xFFEEEEEE),
                color: _red,
                minHeight: 7,
              ),
            ),
            const SizedBox(height: 14),
            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onCancel,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFDDDDDD)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 11),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onViewDetails,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFDE8E8),
                      foregroundColor: _red,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 11),
                    ),
                    child: const Text(
                      'View Details',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Blood bank card ────────────────────────────────────────────────────────
class _BloodBankCard extends StatelessWidget {
  final NearbyBloodBank bank;
  static const _red = Color(0xFFD32F2F);

  const _BloodBankCard({required this.bank});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  bank.name,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.directions_rounded, color: _red, size: 18),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.location_on, size: 12, color: Color(0xFFAAAAAA)),
              const SizedBox(width: 2),
              Text(
                bank.distance,
                style: const TextStyle(fontSize: 11, color: Color(0xFFAAAAAA)),
              ),
            ],
          ),
          const Spacer(),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: bank.availableUnits.entries.map((e) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${e.key} (${e.value})',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
//  Requests Tab
// ════════════════════════════════════════════════════════════
class _RequestsTab extends StatelessWidget {
  final List<HospitalBloodRequest> requests;
  final void Function(HospitalBloodRequest) onCancel;
  final void Function(HospitalBloodRequest) onViewDetails;
  final Widget Function(String, {double size}) bloodGroupBadge;
  final Widget Function(HospitalRequestUrgency) urgencyBadge;
  final VoidCallback onNewRequest;

  static const _red = Color(0xFFD32F2F);

  const _RequestsTab({
    required this.requests,
    required this.onCancel,
    required this.onViewDetails,
    required this.bloodGroupBadge,
    required this.urgencyBadge,
    required this.onNewRequest,
  });

  @override
  Widget build(BuildContext context) {
    final active = requests.where((r) => !r.isCancelled).toList();
    final cancelled = requests.where((r) => r.isCancelled).toList();

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'All Requests',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 14),
        if (active.isEmpty && cancelled.isEmpty)
          Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Icon(
                  Icons.inbox_rounded,
                  size: 60,
                  color: Color(0xFFDDDDDD),
                ),
                const SizedBox(height: 12),
                const Text(
                  'No requests yet.',
                  style: TextStyle(color: Color(0xFF888888)),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: onNewRequest,
                  icon: const Icon(Icons.add, color: Colors.white, size: 18),
                  label: const Text(
                    'Create Request',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _red,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ...active.map(
              (r) => _ActiveRequestCard(
            request: r,
            onCancel: () => onCancel(r),
            onViewDetails: () => onViewDetails(r),
            bloodGroupBadge: bloodGroupBadge,
            urgencyBadge: urgencyBadge,
          ),
        ),
        if (cancelled.isNotEmpty) ...[
          const SizedBox(height: 8),
          const Text(
            'Cancelled',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF888888),
            ),
          ),
          const SizedBox(height: 10),
          ...cancelled.map(
                (r) => _CancelledRequestTile(
              request: r,
              bloodGroupBadge: bloodGroupBadge,
            ),
          ),
        ],
      ],
    );
  }
}

class _CancelledRequestTile extends StatelessWidget {
  final HospitalBloodRequest request;
  final Widget Function(String, {double size}) bloodGroupBadge;

  const _CancelledRequestTile({
    required this.request,
    required this.bloodGroupBadge,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            bloodGroupBadge(request.bloodGroup, size: 40),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    request.reason,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Text(
                    request.neededIn,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFAAAAAA),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'Cancelled',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF888888),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
//  Donors Tab  –  live donor responses with Accept / Deny
// ════════════════════════════════════════════════════════════
class _DonorsTab extends StatelessWidget {
  final List<DonorResponse> donorResponses;
  final void Function(DonorResponse) onAccept;
  final void Function(DonorResponse) onDeny;

  static const _red = Color(0xFFD32F2F);
  static const _green = Color(0xFF2E7D32);

  const _DonorsTab({
    required this.donorResponses,
    required this.onAccept,
    required this.onDeny,
  });

  // Group responses by request
  Map<String, List<DonorResponse>> get _grouped {
    final map = <String, List<DonorResponse>>{};
    for (final dr in donorResponses) {
      map.putIfAbsent(dr.requestReason, () => []).add(dr);
    }
    return map;
  }

  int get _pendingCount => donorResponses
      .where((d) => d.status == DonorResponseStatus.pending)
      .length;

  int get _acceptedCount => donorResponses
      .where((d) => d.status == DonorResponseStatus.accepted)
      .length;

  Color _statusColor(DonorResponseStatus s) => s == DonorResponseStatus.accepted
      ? _green
      : s == DonorResponseStatus.denied
      ? const Color(0xFF9E9E9E)
      : const Color(0xFFF57C00);

  String _statusLabel(DonorResponseStatus s) =>
      s == DonorResponseStatus.accepted
          ? 'Accepted'
          : s == DonorResponseStatus.denied
          ? 'Denied'
          : 'Pending';

  IconData _statusIcon(DonorResponseStatus s) =>
      s == DonorResponseStatus.accepted
          ? Icons.check_circle_rounded
          : s == DonorResponseStatus.denied
          ? Icons.cancel_rounded
          : Icons.hourglass_top_rounded;

  @override
  Widget build(BuildContext context) {
    final grouped = _grouped;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
      children: [
        // ── Summary row ────────────────────────────────────────────
        Row(
          children: [
            _SummaryChip(
              label: '${donorResponses.length} Responded',
              icon: Icons.people_rounded,
              color: const Color(0xFF1565C0),
            ),
            const SizedBox(width: 10),
            _SummaryChip(
              label: '$_pendingCount Pending',
              icon: Icons.hourglass_top_rounded,
              color: const Color(0xFFF57C00),
            ),
            const SizedBox(width: 10),
            _SummaryChip(
              label: '$_acceptedCount Accepted',
              icon: Icons.check_circle_rounded,
              color: _green,
            ),
          ],
        ),

        const SizedBox(height: 24),

        if (donorResponses.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF2F2F2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.volunteer_activism_rounded,
                      size: 36,
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'No donor responses yet.',
                    style: TextStyle(fontSize: 15, color: Color(0xFF888888)),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Donors who accept your requests will appear here.',
                    style: TextStyle(fontSize: 13, color: Color(0xFFAAAAAA)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        else
        // Render each request group
          ...grouped.entries.map((entry) {
            final requestName = entry.key;
            final responses = entry.value;
            final pending = responses
                .where((r) => r.status == DonorResponseStatus.pending)
                .toList();
            final decided = responses
                .where((r) => r.status != DonorResponseStatus.pending)
                .toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Section header ──────────────────────────────────
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            requestName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          Text(
                            '${responses[0].bloodGroup} • ${responses.length} donor${responses.length == 1 ? '' : 's'} responded',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFFAAAAAA),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDE8E8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        responses[0].bloodGroup,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: _red,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // ── Pending donors (show accept/deny) ───────────────
                if (pending.isNotEmpty) ...[
                  _groupLabel('Awaiting Decision', const Color(0xFFF57C00)),
                  const SizedBox(height: 8),
                  ...pending.map(
                        (dr) => _DonorResponseCard(
                      donor: dr,
                      onAccept: () => onAccept(dr),
                      onDeny: () => onDeny(dr),
                      statusColor: _statusColor(dr.status),
                      statusLabel: _statusLabel(dr.status),
                      statusIcon: _statusIcon(dr.status),
                      showActions: true,
                    ),
                  ),
                ],

                // ── Decided donors ──────────────────────────────────
                if (decided.isNotEmpty) ...[
                  if (pending.isNotEmpty) const SizedBox(height: 4),
                  _groupLabel('Decided', const Color(0xFF888888)),
                  const SizedBox(height: 8),
                  ...decided.map(
                        (dr) => _DonorResponseCard(
                      donor: dr,
                      onAccept: () => onAccept(dr),
                      onDeny: () => onDeny(dr),
                      statusColor: _statusColor(dr.status),
                      statusLabel: _statusLabel(dr.status),
                      statusIcon: _statusIcon(dr.status),
                      showActions: false,
                    ),
                  ),
                ],

                const SizedBox(height: 20),
                Divider(color: Colors.grey[200], thickness: 1),
                const SizedBox(height: 16),
              ],
            );
          }),
      ],
    );
  }

  Widget _groupLabel(String label, Color color) => Row(
    children: [
      Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      const SizedBox(width: 6),
      Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    ],
  );
}

// ── Summary chip ───────────────────────────────────────────────────────────
class _SummaryChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _SummaryChip({
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.2), width: 1),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ── Single donor response card ─────────────────────────────────────────────
class _DonorResponseCard extends StatelessWidget {
  final DonorResponse donor;
  final VoidCallback onAccept;
  final VoidCallback onDeny;
  final Color statusColor;
  final String statusLabel;
  final IconData statusIcon;
  final bool showActions;

  static const _red = Color(0xFFD32F2F);
  static const _green = Color(0xFF2E7D32);

  const _DonorResponseCard({
    required this.donor,
    required this.onAccept,
    required this.onDeny,
    required this.statusColor,
    required this.statusLabel,
    required this.statusIcon,
    required this.showActions,
  });

  @override
  Widget build(BuildContext context) {
    final isDenied = donor.status == DonorResponseStatus.denied;

    return Opacity(
      opacity: isDenied ? 0.5 : 1.0,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Top row: avatar | name + info | status badge ──────
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: const Color(0xFFFDE8E8),
                    child: Text(
                      donor.donorName[0].toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        color: _red,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Name + distance + phone
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          donor.donorName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 12,
                              color: Color(0xFFAAAAAA),
                            ),
                            const SizedBox(width: 2),
                            Text(
                              donor.distance,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFFAAAAAA),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.phone,
                              size: 12,
                              color: Color(0xFFAAAAAA),
                            ),
                            const SizedBox(width: 2),
                            Text(
                              donor.phone,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFFAAAAAA),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Blood group
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDE8E8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      donor.bloodGroup,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: _red,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // ── Status pill ───────────────────────────────────────
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: statusColor.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(statusIcon, size: 13, color: statusColor),
                        const SizedBox(width: 4),
                        Text(
                          statusLabel,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: statusColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // ── Action buttons (only for pending) ─────────────────
              if (showActions) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    // Deny
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: onDeny,
                        icon: const Icon(
                          Icons.close_rounded,
                          size: 16,
                          color: Color(0xFF9E9E9E),
                        ),
                        label: const Text(
                          'Deny',
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFFDDDDDD)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Accept
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: onAccept,
                        icon: const Icon(
                          Icons.check_rounded,
                          size: 16,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Accept',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _green,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
//  Profile Tab
// ════════════════════════════════════════════════════════════
class _HospitalProfileTab extends StatelessWidget {
  final HospitalModel hospital;
  static const _red = Color(0xFFD32F2F);

  const _HospitalProfileTab({required this.hospital});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 12),
        Center(
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFFDE8E8),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFFFCDD2), width: 3),
                ),
                alignment: Alignment.center,
                child: Text(
                  hospital.logoInitials,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: _red,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                hospital.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDE8E8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'HOSPITAL STAFF',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: _red,
                    fontSize: 12,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        _profileRow(Icons.location_city_rounded, 'City', hospital.city),
        _profileRow(Icons.map_rounded, 'State', hospital.state),
        _profileRow(Icons.phone_rounded, 'Contact', '+91 20 2612 3000'),
        _profileRow(Icons.email_rounded, 'Email', 'staff@rubyhall.com'),
        _profileRow(
          Icons.verified_rounded,
          'Status',
          'Verified Hospital',
          valueColor: const Color(0xFF2E7D32),
        ),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: () => Navigator.of(context).popUntil((r) => r.isFirst),
          icon: const Icon(Icons.logout_rounded, color: _red, size: 18),
          label: const Text(
            'Sign Out',
            style: TextStyle(color: _red, fontWeight: FontWeight.w600),
          ),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFFFFCDD2)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ],
    );
  }

  Widget _profileRow(
      IconData icon,
      String label,
      String value, {
        Color? valueColor,
      }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: _red),
          const SizedBox(width: 14),
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF888888),
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: valueColor ?? const Color(0xFF1A1A1A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}