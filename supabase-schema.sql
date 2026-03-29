-- İzmir Websitesi - Supabase Schema

-- site_config table (SEO ve genel ayarlar)
CREATE TABLE site_config (
  id BIGINT PRIMARY KEY DEFAULT 1,
  meta_title VARCHAR(255),
  meta_description TEXT,
  meta_keywords VARCHAR(255),
  og_title VARCHAR(255),
  og_description TEXT,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- campaign table
CREATE TABLE campaign (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(255),
  price_old BIGINT,
  price_new BIGINT,
  discount_percent INT,
  features TEXT, -- JSON array
  notes TEXT,
  active BOOLEAN DEFAULT TRUE,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- packages table
CREATE TABLE packages (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  price BIGINT,
  features TEXT, -- JSON array
  order_index INT DEFAULT 0,
  popular BOOLEAN DEFAULT FALSE,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- services table
CREATE TABLE services (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  icon VARCHAR(255), -- Font Awesome class
  description TEXT,
  order_index INT DEFAULT 0,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- portfolio table
CREATE TABLE portfolio (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  category VARCHAR(255),
  description TEXT,
  url VARCHAR(500),
  icon_type VARCHAR(50), -- fa-spa, fa-hotel, etc
  order_index INT DEFAULT 0,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- testimonials table
CREATE TABLE testimonials (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  author VARCHAR(255),
  role VARCHAR(255),
  text TEXT,
  rating INT DEFAULT 5,
  active BOOLEAN DEFAULT TRUE,
  order_index INT DEFAULT 0,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- extra_services table
CREATE TABLE extra_services (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  icon VARCHAR(255), -- Font Awesome class
  description TEXT,
  order_index INT DEFAULT 0,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert default data
INSERT INTO site_config (meta_title, meta_description, meta_keywords, og_title, og_description)
VALUES (
  'İzmir Websitesi - Dijital Dünyada İşiniz Parlasın | Profesyonel Web Tasarım İzmir',
  'İzmir''de küçük işletmeler için profesyonel web tasarım ve dijital çözümler. Kampanya: One Page web sitesi ₺10.000''den başlayan fiyatlarla. Hızlı teslimat, modern tasarım.',
  'web tasarım izmir, kurumsal web sitesi, e-ticaret, SEO, dijital pazarlama, izmir websitesi',
  'İzmir Websitesi - Dijital Dünyada İşiniz Parlasın',
  'Küçük işletmeleri büyüten profesyonel web tasarım ve dijital çözümler. ₺10.000''den başlayan fiyatlarla.'
);

INSERT INTO campaign (title, price_old, price_new, discount_percent, features, notes, active)
VALUES (
  'One Page Web Sitesi',
  15000,
  10000,
  33,
  '["Tek sayfalık profesyonel site","Smooth scroll menü","Responsive tasarım (mobil uyumlu)","Temel iletişim formu","Hızlı teslimat (3-5 gün)"]',
  'İşinize başlamanız için mükemmel bir başlangıç!',
  TRUE
);

INSERT INTO packages (name, price, features, order_index, popular)
VALUES
  ('Başlangıç+', 20000, '["5-7 sayfa","Responsive tasarım","İletişim formu","Temel SEO"]', 0, FALSE),
  ('Profesyonel', 28000, '["10-15 sayfa","Blog sistemi","Galeri modülü","Gelişmiş SEO"]', 1, TRUE),
  ('Premium', 38000, '["15-20 sayfa","E-ticaret temel","Özel özellikler","Öncelikli destek"]', 2, FALSE),
  ('Enterprise', NULL, '["Tam özelleştirme","Tüm özellikler","Özel entegrasyon","7/24 destek"]', 3, FALSE);

INSERT INTO services (name, icon, description, order_index)
VALUES
  ('Kurumsal Web Sitesi', 'fa-building-columns', 'Profesyonel, modern tasarımlı kurumsal web siteleri ile markanızı dijitalde güçlü şekilde temsil edin.', 0),
  ('E-Ticaret Siteleri', 'fa-bag-shopping', 'Online satış ve yönetim altyapısı ile ürünlerinizi 7/24 satışa sunun.', 1),
  ('SEO Optimizasyonu', 'fa-arrow-trend-up', 'Arama motorlarında üst sıralara çıkın, daha fazla müşteriye ulaşın.', 2),
  ('Web Tasarım', 'fa-pen-nib', 'Markanıza özel, kullanıcı dostu ve etkileyici web tasarım çözümleri.', 3),
  ('Bakım & Destek', 'fa-shield-heart', 'Sürekli teknik destek ve bakım hizmetleri ile siteniz her zaman sorunsuz çalışsın.', 4);

INSERT INTO portfolio (name, category, description, url, icon_type, order_index)
VALUES
  ('İzmir Yoga', 'Yoga Okulu', 'İzmir''nin önde gelen yoga okulu için modern, huzurlu ve kullanıcı dostu bir web sitesi tasarladık.', 'https://izmiryoga.com', 'fa-spa', 0),
  ('Hotel By Karaaslan Inn', 'Otel', 'Butik otel için şık ve profesyonel bir web sitesi. Rezervasyon sistemi ve galeri entegrasyonu.', 'https://karaaslanhotels.com', 'fa-hotel', 1);

INSERT INTO testimonials (author, role, text, rating, active, order_index)
VALUES
  ('Ahmet Yılmaz', 'Kafe Sahibi', 'İzmir Websitesi sayesinde online satışlarımız 3 katına çıktı! Çok memnunum.', 5, TRUE, 0),
  ('Fatma Kaya', 'Kuaför', 'Tasarımı ve hızlılığı çok sevdim, tavsiye ediyorum!', 5, TRUE, 1),
  ('Mehmet Demir', 'Restaurant Sahibi', 'Fiyat/performans açısından en iyi seçim yaptık.', 5, TRUE, 2);

INSERT INTO extra_services (name, icon, description, order_index)
VALUES
  ('SEO Paketi', 'fa-magnifying-glass-chart', '3 aylık optimizasyon', 0),
  ('Bakım & Destek', 'fa-screwdriver-wrench', 'Aylık teknik destek', 1),
  ('Ek Sayfa', 'fa-file-circle-plus', 'İhtiyaca göre ek sayfalar', 2),
  ('E-ticaret Entegrasyonu', 'fa-store', 'Online satış altyapısı', 3);

-- RLS Policies (public read access)
ALTER TABLE site_config ENABLE ROW LEVEL SECURITY;
ALTER TABLE campaign ENABLE ROW LEVEL SECURITY;
ALTER TABLE packages ENABLE ROW LEVEL SECURITY;
ALTER TABLE services ENABLE ROW LEVEL SECURITY;
ALTER TABLE portfolio ENABLE ROW LEVEL SECURITY;
ALTER TABLE testimonials ENABLE ROW LEVEL SECURITY;
ALTER TABLE extra_services ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read" ON site_config FOR SELECT USING (true);
CREATE POLICY "Public read" ON campaign FOR SELECT USING (true);
CREATE POLICY "Public read" ON packages FOR SELECT USING (true);
CREATE POLICY "Public read" ON services FOR SELECT USING (true);
CREATE POLICY "Public read" ON portfolio FOR SELECT USING (true);
CREATE POLICY "Public read" ON testimonials FOR SELECT USING (true);
CREATE POLICY "Public read" ON extra_services FOR SELECT USING (true);
