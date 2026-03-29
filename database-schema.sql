-- ==========================================
-- 茶海虾王官方网站 - Supabase 数据库表结构
-- 执行此 SQL 脚本创建所需的数据表
-- ==========================================

-- 1. 新闻表 (news)
CREATE TABLE IF NOT EXISTS news (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    desc TEXT,
    url VARCHAR(500) NOT NULL,
    date DATE NOT NULL DEFAULT CURRENT_DATE,
    is_published BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. 产品表 (products)
CREATE TABLE IF NOT EXISTS products (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL DEFAULT 0,
    category VARCHAR(50) NOT NULL,
    icon VARCHAR(50),
    tag VARCHAR(50),
    link_url VARCHAR(500),
    is_published BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. 工具表 (tools)
CREATE TABLE IF NOT EXISTS tools (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    desc TEXT,
    download_url VARCHAR(500) NOT NULL,
    is_published BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ==========================================
-- 插入示例数据（可选）
-- ==========================================

-- 示例新闻
INSERT INTO news (title, desc, url, date, is_published) VALUES
('茶海虾王平台正式上线', '融合传统与现代的久潮流互联网平台正式运营', 'https://github.com/rao5201/chxw-official', CURRENT_DATE, TRUE),
('网络安全新趋势', '数字安全成为互联网发展的重要方向', 'https://news.sina.com.cn', CURRENT_DATE - 1, TRUE),
('农副产品电商发展报告', '2024 年农副产品电商市场持续增长', 'https://news.sina.com.cn', CURRENT_DATE - 2, TRUE);

-- 示例产品
INSERT INTO products (title, price, category, icon, tag, link_url, is_published) VALUES
('网络安全防护软件', 299.00, 'digital', '🔒', '热销', '#', TRUE),
('有机茶叶礼盒', 198.00, 'agri', '🍵', '新品', '#', TRUE),
('新能源汽车充电桩', 2999.00, 'auto', '⚡', '爆款', '#', TRUE),
('工业级传感器', 599.00, 'industry', '🏭', '', '#', TRUE);

-- 示例工具
INSERT INTO tools (title, desc, download_url, is_published) VALUES
('IP 查询工具', '快速查询 IP 地址归属地', 'https://ipapi.co', TRUE),
('在线格式化工具', 'JSON/XML 格式化 beautifier', 'https://jsonformatter.org', TRUE);

-- ==========================================
-- 创建索引（优化查询性能）
-- ==========================================

CREATE INDEX IF NOT EXISTS idx_news_published ON news(is_published, date DESC);
CREATE INDEX IF NOT EXISTS idx_products_category ON products(category, is_published);
CREATE INDEX IF NOT EXISTS idx_tools_published ON tools(is_published);

-- ==========================================
-- 完成提示
-- ==========================================
-- ✅ 数据库表结构创建完成
-- ✅ 示例数据已插入
-- ✅ 索引已创建
