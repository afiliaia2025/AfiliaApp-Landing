/* ========================================
   AFILIAAPP LANDING — INTERACTIONS
   ======================================== */

/* --- Config (edit here to update everywhere) --- */
const WA_NUMBER = '34634427730';

document.addEventListener('DOMContentLoaded', () => {
    initNavbar();
    initScrollAnimations();
    initCounterAnimations();
    initFAQ();
    initMobileMenu();
    initSmoothScroll();
    initWhatsAppLinks();
});

/* --- Navbar Scroll Effect --- */
function initNavbar() {
    const navbar = document.querySelector('.navbar');
    if (!navbar) return;

    const handleScroll = () => {
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    };

    window.addEventListener('scroll', handleScroll, { passive: true });
    handleScroll();
}

/* --- Scroll Animations (IntersectionObserver) --- */
function initScrollAnimations() {
    const animatedElements = document.querySelectorAll('.fade-in, .fade-in-left, .fade-in-right');

    if (!animatedElements.length) return;

    const observer = new IntersectionObserver(
        (entries) => {
            entries.forEach((entry) => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                    observer.unobserve(entry.target);
                }
            });
        },
        {
            threshold: 0.15,
            rootMargin: '0px 0px -40px 0px',
        }
    );

    animatedElements.forEach((el) => observer.observe(el));
}

/* --- Counter Animation --- */
function initCounterAnimations() {
    const counters = document.querySelectorAll('[data-count]');
    if (!counters.length) return;

    const observer = new IntersectionObserver(
        (entries) => {
            entries.forEach((entry) => {
                if (entry.isIntersecting) {
                    animateCounter(entry.target);
                    observer.unobserve(entry.target);
                }
            });
        },
        { threshold: 0.5 }
    );

    counters.forEach((el) => observer.observe(el));
}

function animateCounter(element) {
    const target = parseInt(element.getAttribute('data-count'), 10);
    const suffix = element.getAttribute('data-suffix') || '';
    const prefix = element.getAttribute('data-prefix') || '';
    const duration = 800;
    const startValue = target === 0 ? 0 : Math.floor(target * 0.85);
    const startTime = performance.now();

    function update(currentTime) {
        const elapsed = currentTime - startTime;
        const progress = Math.min(elapsed / duration, 1);

        // Ease out cubic
        const eased = 1 - Math.pow(1 - progress, 3);
        const current = Math.floor(startValue + eased * (target - startValue));

        element.textContent = prefix + current.toLocaleString('es-ES') + suffix;

        if (progress < 1) {
            requestAnimationFrame(update);
        } else {
            element.textContent = prefix + target.toLocaleString('es-ES') + suffix;
        }
    }

    requestAnimationFrame(update);
}

/* --- FAQ Accordion --- */
function initFAQ() {
    const faqItems = document.querySelectorAll('.faq__item');

    faqItems.forEach((item) => {
        const question = item.querySelector('.faq__question');

        question.addEventListener('click', () => {
            const isActive = item.classList.contains('active');

            // Close all others
            faqItems.forEach((other) => other.classList.remove('active'));

            // Toggle current
            if (!isActive) {
                item.classList.add('active');
            }
        });
    });
}

/* --- Mobile Menu --- */
function initMobileMenu() {
    const hamburger = document.querySelector('.hamburger');
    const navLinks = document.querySelector('.navbar__links');

    if (!hamburger || !navLinks) return;

    const toggleMenu = () => {
        const isOpen = navLinks.classList.toggle('open');
        hamburger.classList.toggle('active', isOpen);
        hamburger.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
        document.body.style.overflow = isOpen ? 'hidden' : '';
    };

    hamburger.addEventListener('click', toggleMenu);
    hamburger.addEventListener('keydown', (e) => {
        if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); toggleMenu(); }
    });

    // Close menu when clicking a link
    navLinks.querySelectorAll('a').forEach((link) => {
        link.addEventListener('click', () => {
            hamburger.classList.remove('active');
            navLinks.classList.remove('open');
            hamburger.setAttribute('aria-expanded', 'false');
            document.body.style.overflow = '';
        });
    });
}

/* --- Smooth Scroll for Anchor Links --- */
function initSmoothScroll() {
    document.querySelectorAll('a[href^="#"]').forEach((link) => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const targetId = link.getAttribute('href');

            if (targetId === '#') return;

            const target = document.querySelector(targetId);
            if (target) {
                const navHeight = document.querySelector('.navbar')?.offsetHeight || 0;
                const targetPosition = target.offsetTop - navHeight - 10;

                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth',
                });
            }
        });
    });
}

/* ========================================
   DEMO MODAL
   ======================================== */
function openDemoModal(e) {
    if (e) e.preventDefault();
    const overlay = document.getElementById('demoModal');
    if (!overlay) return;
    overlay.classList.add('open');
    document.body.style.overflow = 'hidden';
    setTimeout(() => {
        const first = overlay.querySelector('.modal__input');
        if (first) first.focus();
    }, 300);
}

function closeDemoModal() {
    const overlay = document.getElementById('demoModal');
    if (!overlay) return;
    overlay.classList.remove('open');
    document.body.style.overflow = '';
}

function handleModalOverlayClick(e) {
    if (e.target === e.currentTarget) closeDemoModal();
}

document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') closeDemoModal();
});

function submitDemoForm(e) {
    e.preventDefault();
    const nombre = document.getElementById('demo-nombre')?.value.trim() || '';
    const sindicato = document.getElementById('demo-sindicato')?.value.trim() || '';
    const email = document.getElementById('demo-email')?.value.trim() || '';
    const mensaje = document.getElementById('demo-mensaje')?.value.trim() || '';

    const subject = encodeURIComponent(`Solicitud de demo — ${sindicato}`);
    const body = encodeURIComponent(
        `Hola,\n\nOs contacto para solicitar una demo de AfiliaApp.\n\n` +
        `Nombre: ${nombre}\n` +
        `Sindicato: ${sindicato}\n` +
        `Email de contacto: ${email}\n\n` +
        (mensaje ? `Mensaje: ${mensaje}\n\n` : '') +
        `Un saludo.`
    );

    window.location.href = `mailto:contacto@afiliaapp.com?subject=${subject}&body=${body}`;
    setTimeout(closeDemoModal, 500);
}

/* --- WhatsApp Links (centralized via WA_NUMBER) --- */
function initWhatsAppLinks() {
    document.querySelectorAll('a[href*="wa.me"]').forEach((link) => {
        const href = link.getAttribute('href');
        link.setAttribute('href', href.replace(/wa\.me\/\d+/, 'wa.me/' + WA_NUMBER));
    });
}
