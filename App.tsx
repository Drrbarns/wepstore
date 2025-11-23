import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Navbar from './components/Navbar';
import Footer from './components/Footer';
import Home from './pages/Home';
import AboutUs from './pages/AboutUs';
import ContactUs from './pages/ContactUs';
import PricingPage from './pages/PricingPage';
import FAQPage from './pages/FAQPage';
import Privacy from './pages/Privacy';
import Terms from './pages/Terms';
import Careers from './pages/Careers';
import BlogPage from './pages/BlogPage';
import Partners from './pages/Partners';
import Developers from './pages/Developers';
import Payments from './pages/Payments';
import Affiliate from './pages/Affiliate';
// Blog Posts
import ScalingKioskToDigital from './pages/blog/ScalingKioskToDigital';
import Top5PaymentGateways from './pages/blog/Top5PaymentGateways';
import DesignTipsAfricanCulture from './pages/blog/DesignTipsAfricanCulture';
import DropshippingGhana from './pages/blog/DropshippingGhana';
import MobileMoneyIntegration from './pages/blog/MobileMoneyIntegration';
import AccraThriftSuccess from './pages/blog/AccraThriftSuccess';
import SEOLocalLanguages from './pages/blog/SEOLocalLanguages';

const App: React.FC = () => {
  return (
    <Router>
      <div className="min-h-screen bg-white text-gray-900">
        <Navbar />
        
        <main>
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/about" element={<AboutUs />} />
            <Route path="/contact" element={<ContactUs />} />
            <Route path="/pricing" element={<PricingPage />} />
            <Route path="/faq" element={<FAQPage />} />
            <Route path="/privacy" element={<Privacy />} />
            <Route path="/terms" element={<Terms />} />
            <Route path="/careers" element={<Careers />} />
            <Route path="/blog" element={<BlogPage />} />
            <Route path="/partners" element={<Partners />} />
            <Route path="/developers" element={<Developers />} />
            <Route path="/payments" element={<Payments />} />
            <Route path="/affiliate" element={<Affiliate />} />
            {/* Blog Posts */}
            <Route path="/blog/scaling-kiosk-to-digital" element={<ScalingKioskToDigital />} />
            <Route path="/blog/top-5-payment-gateways" element={<Top5PaymentGateways />} />
            <Route path="/blog/design-tips-african-culture" element={<DesignTipsAfricanCulture />} />
            <Route path="/blog/dropshipping-ghana" element={<DropshippingGhana />} />
            <Route path="/blog/mobile-money-integration" element={<MobileMoneyIntegration />} />
            <Route path="/blog/accra-thrift-success" element={<AccraThriftSuccess />} />
            <Route path="/blog/seo-local-languages" element={<SEOLocalLanguages />} />
          </Routes>
        </main>

        <Footer />
      </div>
    </Router>
  );
};

export default App;
