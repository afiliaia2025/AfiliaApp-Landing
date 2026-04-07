import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'planes26_model.dart';
export 'planes26_model.dart';

class Planes26Widget extends StatefulWidget {
  const Planes26Widget({super.key});

  static String routeName = 'Planes26';
  static String routePath = '/planes26';

  @override
  State<Planes26Widget> createState() => _Planes26WidgetState();
}

class _Planes26WidgetState extends State<Planes26Widget> {
  late Planes26Model _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Planes26Model());
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final isDesktop = MediaQuery.sizeOf(context).width >= 768;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF0D0D0D),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // ===== NAV =====
                _buildNav(theme),
                // ===== HERO =====
                _buildHero(theme, isDesktop),
                // ===== PRICING CARDS =====
                _buildPricingCards(theme, isDesktop),
                // ===== CALCULADORA =====
                _buildCalculadora(theme, isDesktop),
                // ===== EXTRA IA =====
                _buildExtraIA(theme, isDesktop),
                // ===== DESCUENTOS VOLUMEN =====
                _buildVolumen(theme, isDesktop),
                // ===== REFERIDOS =====
                _buildReferidos(theme, isDesktop),
                // ===== CTA BETA =====
                _buildCtaBeta(theme, isDesktop),
                // ===== FOOTER =====
                _buildFooter(theme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ===== NAV =====
  Widget _buildNav(FlutterFlowTheme theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      color: const Color(0xFF0D0D0D),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(children: [
            Image.asset('assets/images/afiliaApp_logo_peque.png',
                height: 36, fit: BoxFit.contain),
            const SizedBox(width: 10),
            Text('AfiliaApp',
                style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600)),
          ]),
          // Links
          Row(children: [
            _navLink('Inicio', '/'),
            const SizedBox(width: 24),
            _navLink('Planes', '/planes26'),
            const SizedBox(width: 24),
            _navLink('Contacto', '/acceso'),
          ]),
        ],
      ),
    );
  }

  Widget _navLink(String label, String route) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.pushNamed(route == '/' ? 'home' : route.replaceAll('/', '')),
        child: Text(label,
            style: GoogleFonts.inter(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
      ),
    );
  }

  // ===== HERO =====
  Widget _buildHero(FlutterFlowTheme theme, bool isDesktop) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 40 : 20, vertical: isDesktop ? 60 : 40),
      child: Column(
        children: [
          // Título
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text('Tu sindicato digital ',
                  style: GoogleFonts.bebasNeue(
                      color: Colors.white,
                      fontSize: isDesktop ? 50 : 32,
                      fontWeight: FontWeight.bold)),
              Text('desde 0€.',
                  style: GoogleFonts.bebasNeue(
                      color: theme.primary,
                      fontSize: isDesktop ? 50 : 32,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Sin coste de desarrollo. Sin permanencia larga. Paga solo por lo que necesitas.',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                color: theme.tertiary,
                fontSize: isDesktop ? 18 : 14,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 8),
          Text(
            'Cuantos más afiliados, más barato por persona.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                color: theme.primary,
                fontSize: isDesktop ? 15 : 13,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  // ===== PRICING CARDS =====
  Widget _buildPricingCards(FlutterFlowTheme theme, bool isDesktop) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 40 : 16),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _freemiumCard(theme)),
                const SizedBox(width: 16),
                Expanded(child: _estandarCard(theme)),
                const SizedBox(width: 16),
                Expanded(child: _premiumCard(theme)),
              ],
            )
          : Column(
              children: [
                _freemiumCard(theme),
                const SizedBox(height: 16),
                _estandarCard(theme),
                const SizedBox(height: 16),
                _premiumCard(theme),
              ],
            ),
    );
  }

  // ---------- FREEMIUM ----------
  Widget _freemiumCard(FlutterFlowTheme theme) {
    return _planCard(
      theme: theme,
      borderColor: theme.secondary,
      badge: '',
      badgeColor: Colors.transparent,
      planName: 'FREEMIUM',
      planSubtitle: 'Empieza sin riesgo',
      price: '0€',
      priceColor: theme.primaryText,
      period: '/mes',
      description:
          'Lo esencial para empezar. Tu app, tu marca, tus primeros avisos.',
      features: [
        'App con tu marca (logo + colores)',
        'Hasta 50 afiliados',
        '4 avisos push / mes',
        '4 noticias / mes',
        'Normativa en PDF (lectura)',
        'FAQ: 1 sección / 10 preguntas',
        '1 administrador',
        'Soporte por email',
      ],
      buttonText: 'Empezar gratis',
      buttonFilled: false,
      nota: 'Sin tarjeta. Sin compromiso.',
    );
  }

  // ---------- ESTÁNDAR ----------
  Widget _estandarCard(FlutterFlowTheme theme) {
    return _planCard(
      theme: theme,
      borderColor: theme.primary,
      badge: '⭐ Más popular',
      badgeColor: theme.primary,
      planName: 'ESTÁNDAR',
      planSubtitle: 'Para sindicatos activos',
      price: '0,30€',
      priceColor: theme.primary,
      period: '/afiliado/mes',
      description:
          'Todo lo que necesitas para funcionar de verdad. Turnos, delegados y comunicación sin límites.',
      features: [
        'Todo lo del Freemium',
        'Afiliados ilimitados',
        'Avisos y noticias ilimitados',
        'Segmentación por grupo/ciudad',
        'Alta y baja digital',
        'Turnos en lectura (7 días)',
        'Carné digital con QR',
        'Certificado de afiliación PDF',
        'Eventos y asistencia',
        'Beneficios y ventajas',
        'FAQ: 3 secciones / 30 preguntas',
        '1 admin + 3 delegados',
        'Analítica por sección',
        'Import/export CSV',
        'Soporte WhatsApp',
      ],
      buttonText: 'Solicitar acceso',
      buttonFilled: true,
      nota: 'Compromiso mínimo: 3 meses',
    );
  }

  // ---------- PREMIUM ----------
  Widget _premiumCard(FlutterFlowTheme theme) {
    return _planCard(
      theme: theme,
      borderColor: theme.secondary,
      badge: 'Completo',
      badgeColor: theme.secondary,
      planName: 'PREMIUM',
      planSubtitle: 'Tu sindicato al máximo nivel',
      price: '0,45€',
      priceColor: theme.primaryText,
      period: '/afiliado/mes',
      description:
          'Organización profesional. Chat, votaciones, IA y delegados ilimitados.',
      features: [
        'Todo lo del Estándar',
        'Turnos mensual + informe anual',
        'Segmentación avanzada (turno/categoría)',
        'Encuestas internas + resultados live',
        'Votaciones formales con cierre',
        'Chat afiliado ↔ delegado por áreas',
        'FAQ ilimitado',
        'Delegados ilimitados por zona',
        'Trámites y recursos digitales',
        'Analítica avanzada + export',
        'Soporte prioritario',
      ],
      buttonText: 'Solicitar acceso',
      buttonFilled: false,
      nota: 'Compromiso mínimo: 3 meses',
    );
  }

  // ===== PLAN CARD BUILDER =====
  Widget _planCard({
    required FlutterFlowTheme theme,
    required Color borderColor,
    required String badge,
    required Color badgeColor,
    required String planName,
    required String planSubtitle,
    required String price,
    required Color priceColor,
    required String period,
    required String description,
    required List<String> features,
    required String buttonText,
    required bool buttonFilled,
    required String nota,
  }) {
    return Container(
      constraints: const BoxConstraints(minHeight: 720),
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 2),
        boxShadow: const [
          BoxShadow(
              blurRadius: 12,
              color: Color(0x33000000),
              offset: Offset(0, 4)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Badge
            if (badge.isNotEmpty)
              Align(
                alignment: Alignment.center,
                child: Text(badge,
                    style: GoogleFonts.inter(
                        color: badgeColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600)),
              ),
            if (badge.isNotEmpty) const SizedBox(height: 8),
            // Plan name
            Text(planName,
                style: GoogleFonts.oswald(
                    color: priceColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w400)),
            Text(planSubtitle,
                style: GoogleFonts.inter(
                    color: theme.secondary, fontSize: 12)),
            const SizedBox(height: 16),
            // Price
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(price,
                    style: GoogleFonts.oswald(
                        color: priceColor,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        height: 1.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 4, bottom: 8),
                  child: Text(period,
                      style: GoogleFonts.inter(
                          color: theme.secondary, fontSize: 14)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Description
            Text(description,
                style: GoogleFonts.inter(
                    color: theme.secondary, fontSize: 12, height: 1.5)),
            const SizedBox(height: 20),
            // Divider
            Container(height: 1, color: borderColor.withOpacity(0.3)),
            const SizedBox(height: 16),
            // Features
            ...features.map((f) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_outlined,
                          color: borderColor, size: 15),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(f,
                            style: GoogleFonts.inter(
                                color: theme.secondary,
                                fontSize: 12,
                                height: 1.3)),
                      ),
                    ],
                  ),
                )),
            const Spacer(),
            // Nota
            if (nota.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(nota,
                    style: GoogleFonts.inter(
                        color: theme.primaryText,
                        fontSize: 11,
                        fontWeight: FontWeight.w600)),
              ),
            // Button
            SizedBox(
              width: double.infinity,
              child: buttonFilled
                  ? ElevatedButton(
                      onPressed: () => context.pushNamed('acceso'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(buttonText,
                          style: GoogleFonts.inter(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    )
                  : OutlinedButton(
                      onPressed: () => context.pushNamed('acceso'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(color: theme.secondary),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(buttonText,
                          style: GoogleFonts.inter(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // ===== CALCULADORA VISUAL =====
  Widget _buildCalculadora(FlutterFlowTheme theme, bool isDesktop) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 40 : 20, vertical: 48),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: theme.secondaryBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.primary.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Text('¿CUÁNTO PAGARÍAS?',
                style: GoogleFonts.bebasNeue(
                    color: theme.primary,
                    fontSize: 28,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            // Ejemplos
            _calculadoraRow(theme, '200 afiliados', '60€/mes', '90€/mes',
                '0,30€/afil', '0,45€/afil'),
            _calculadoraRow(theme, '500 afiliados', '150€/mes', '225€/mes',
                '0,30€/afil', '0,45€/afil'),
            _calculadoraRow(theme, '1.000 afiliados', '275€/mes', '425€/mes',
                '0,28€/afil', '0,43€/afil'),
            _calculadoraRow(theme, '2.000 afiliados', '500€/mes', '800€/mes',
                '0,25€/afil', '0,40€/afil'),
            const SizedBox(height: 16),
            Text(
              'Menos que un café por afiliado al mes. Menos que la factura de fotocopias del convenio.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  color: theme.secondary,
                  fontSize: 13,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  Widget _calculadoraRow(FlutterFlowTheme theme, String afiliados,
      String precioEst, String precioPrem, String perAfilEst, String perAfilPrem) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(afiliados,
                  style: GoogleFonts.oswald(
                      color: theme.primaryText,
                      fontSize: 16,
                      fontWeight: FontWeight.w600))),
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(precioEst,
                      style: GoogleFonts.oswald(
                          color: theme.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text(perAfilEst,
                      style: GoogleFonts.inter(
                          color: theme.secondary, fontSize: 11)),
                ],
              )),
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(precioPrem,
                      style: GoogleFonts.oswald(
                          color: theme.primaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text(perAfilPrem,
                      style: GoogleFonts.inter(
                          color: theme.secondary, fontSize: 11)),
                ],
              )),
        ],
      ),
    );
  }

  // ===== EXTRA IA =====
  Widget _buildExtraIA(FlutterFlowTheme theme, bool isDesktop) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 40 : 20),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.secondaryBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF6C3AED), width: 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.smart_toy, color: Color(0xFF6C3AED), size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('EXTRA: IA NORMATIVA',
                      style: GoogleFonts.oswald(
                          color: const Color(0xFF6C3AED),
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text('+0,099€',
                          style: GoogleFonts.oswald(
                              color: theme.primaryText,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      Text(' /afiliado/mes',
                          style: GoogleFonts.inter(
                              color: theme.secondary, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Un asistente IA que responde preguntas sobre tu convenio citando el artículo exacto. Genera borradores de escritos y sugiere FAQ automáticamente.',
                    style: GoogleFonts.inter(
                        color: theme.secondary, fontSize: 12, height: 1.5),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Disponible en Estándar y Premium.',
                    style: GoogleFonts.inter(
                        color: theme.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===== DESCUENTOS POR VOLUMEN =====
  Widget _buildVolumen(FlutterFlowTheme theme, bool isDesktop) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 40 : 20, vertical: 48),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.secondaryBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.secondary.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Text('DESCUENTOS POR VOLUMEN',
                style: GoogleFonts.bebasNeue(
                    color: theme.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
            const SizedBox(height: 4),
            Text('Cuantos más afiliados, más barato por persona.',
                style: GoogleFonts.inter(
                    color: theme.secondary, fontSize: 13)),
            const SizedBox(height: 20),
            // Tabla
            _volumenHeader(theme),
            _volumenRow(theme, '0 – 500', '0,30 €', '0,45 €'),
            _volumenRow(theme, '501 – 1.000', '0,25 €', '0,40 €'),
            _volumenRow(theme, '> 1.000', '0,20 €', '0,35 €'),
            const SizedBox(height: 16),
            Text(
              'Ejemplo: 1.200 afiliados en Estándar → 500×0,30 + 500×0,25 + 200×0,20 = 315€/mes (0,26€/afil)',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  color: theme.secondary,
                  fontSize: 11,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 8),
            Text(
              '> 2.000 afiliados → Contacta con nosotros para un precio personalizado.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  color: theme.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _volumenHeader(FlutterFlowTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(children: [
        Expanded(
            flex: 2,
            child: Text('Afiliados',
                style: GoogleFonts.inter(
                    color: theme.primaryText,
                    fontSize: 13,
                    fontWeight: FontWeight.w700))),
        Expanded(
            child: Text('Estándar',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    color: theme.primary,
                    fontSize: 13,
                    fontWeight: FontWeight.w700))),
        Expanded(
            child: Text('Premium',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    color: theme.primaryText,
                    fontSize: 13,
                    fontWeight: FontWeight.w700))),
      ]),
    );
  }

  Widget _volumenRow(
      FlutterFlowTheme theme, String rango, String est, String prem) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(children: [
        Expanded(
            flex: 2,
            child: Text(rango,
                style: GoogleFonts.inter(
                    color: theme.secondary, fontSize: 13))),
        Expanded(
            child: Text(est,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    color: theme.secondary, fontSize: 13))),
        Expanded(
            child: Text(prem,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    color: theme.secondary, fontSize: 13))),
      ]),
    );
  }

  // ===== PROGRAMA DE REFERIDOS =====
  Widget _buildReferidos(FlutterFlowTheme theme, bool isDesktop) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 40 : 20),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.secondaryBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.primary),
        ),
        child: Column(
          children: [
            Text('PROGRAMA DE REFERIDOS',
                style: GoogleFonts.bebasNeue(
                    color: theme.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
            const SizedBox(height: 16),
            _referidoItem(theme,
                '🎯 Recomienda AfiliaApp a otro sindicato y obtén 100€/año de descuento.'),
            _referidoItem(
                theme, '📈 Máximo 3 referidos/año = hasta 300€ de ahorro.'),
            _referidoItem(theme,
                '🤝 El sindicato referido también obtiene su primer mes gratis.'),
          ],
        ),
      ),
    );
  }

  Widget _referidoItem(FlutterFlowTheme theme, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text,
          style: GoogleFonts.inter(
              color: theme.secondary, fontSize: 13, height: 1.5)),
    );
  }

  // ===== CTA BETA =====
  Widget _buildCtaBeta(FlutterFlowTheme theme, bool isDesktop) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 40 : 20, vertical: 48),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        padding: EdgeInsets.all(isDesktop ? 40 : 24),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1A1A1A), Color(0xFF0D0D0D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: theme.primary, width: 2),
        ),
        child: isDesktop
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('¿EMPEZAMOS CON TU SINDICATO?',
                            style: GoogleFonts.bebasNeue(
                                color: theme.primaryText,
                                fontSize: 32,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(
                          'Activa tu app en menos de 48h. Sin desarrollo. Sin sorpresas.',
                          style: GoogleFonts.inter(
                              color: theme.secondary, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  ElevatedButton(
                    onPressed: () => context.pushNamed('acceso'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 36, vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text('Solicitar demo',
                        style: GoogleFonts.inter(
                            fontSize: 15, fontWeight: FontWeight.w600)),
                  ),
                ],
              )
            : Column(
                children: [
                  Text('¿EMPEZAMOS CON TU SINDICATO?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.bebasNeue(
                          color: theme.primaryText,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    'Activa tu app en menos de 48h. Sin desarrollo. Sin sorpresas.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        color: theme.secondary, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => context.pushNamed('acceso'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text('Solicitar demo',
                          style: GoogleFonts.inter(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  // ===== FOOTER =====
  Widget _buildFooter(FlutterFlowTheme theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      color: const Color(0xFF0A0A0A),
      child: Column(
        children: [
          Text('AfiliaApp © 2025 — Todos los derechos reservados.',
              style: GoogleFonts.inter(
                  color: theme.secondary.withOpacity(0.6), fontSize: 12)),
          const SizedBox(height: 4),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => context.pushNamed('privacidad'),
              child: Text('Política de privacidad',
                  style: GoogleFonts.inter(
                      color: theme.secondary.withOpacity(0.6),
                      fontSize: 12,
                      decoration: TextDecoration.underline)),
            ),
          ),
        ],
      ),
    );
  }
}
