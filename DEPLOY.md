# 茶海虾王官方网站 - 部署指南

## 📋 项目简介

茶海虾王 (CHXW) 官方网站 - 融合传统与现代的久潮流互联网平台

- **动态内容管理**：基于 Supabase 数据库
- **实时更新**：新闻、产品、工具模块后台直连
- **响应式设计**：支持 PC 和移动端

## 🚀 部署步骤

### 方式一：GitHub Pages（推荐）

1. 访问仓库设置：https://github.com/rao5201/chxw-official/settings/pages

2. 配置 Pages：
   - Source: Deploy from a branch
   - Branch: main
   - Folder: / (root)

3. 等待部署完成，访问地址：
   - https://rao5201.github.io/chxw-official/

### 方式二：Vercel 部署

1. 访问 https://vercel.com/new

2. 导入 GitHub 仓库 `rao5201/chxw-official`

3. 点击 Deploy 自动部署

4. 获得域名：`https://chxw-official.vercel.app`

## 🗄️ 数据库配置

### Supabase 设置

1. 访问 https://supabase.com/dashboard

2. 选择项目：`bafeelbyfmsjspapvtzr`

3. 进入 SQL Editor

4. 执行 `database-schema.sql` 脚本创建表结构

### 数据表说明

| 表名 | 用途 | 关键字段 |
|------|------|----------|
| news | 新闻管理 | title, desc, url, date |
| products | 产品管理 | title, price, category, link_url |
| tools | 工具推荐 | title, desc, download_url |

### 分类配置

产品支持以下分类：
- `digital` - 数字安全 🔒
- `agri` - 农副产品 🥬
- `auto` - 新能源汽车 🚗
- `industry` - 生产资料 🏭
- `other` - 其他产品 📦

## 🔧 本地测试

```bash
# 克隆仓库
git clone https://github.com/rao5201/chxw-official.git
cd chxw-official

# 使用 Live Server 打开 index.html
# 或使用 VS Code Live Server 插件
```

## 📝 内容管理

### 添加新闻
```sql
INSERT INTO news (title, desc, url, date) 
VALUES ('新闻标题', '描述', '链接', '2024-01-01');
```

### 添加产品
```sql
INSERT INTO products (title, price, category, icon, tag, link_url) 
VALUES ('产品名', 99.00, 'agri', '🍵', '新品', '购买链接');
```

### 添加工具
```sql
INSERT INTO tools (title, desc, download_url) 
VALUES ('工具名', '描述', '下载链接');
```

## 🔗 访问地址

- **GitHub 仓库**: https://github.com/rao5201/chxw-official
- **在线演示**: https://rao5201.github.io/chxw-official/
- **技术支持**: rao5201@126.com

## 📞 联系方式

- 邮箱：rao5201@126.com
- GitHub: @rao5201

---

© 2024 茶海虾王 (CHXW). All Rights Reserved.
