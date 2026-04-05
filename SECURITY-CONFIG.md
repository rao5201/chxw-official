# 🔒 茶海虾王官方网站 - 仓库安全配置指南

**配置时间**: 2026-04-04  
**版本**: v1.0.1  
**安全级别**: 标准保护

---

## 🛡️ 仓库保护目标

- ✅ 防止未授权用户修改代码
- ✅ 保护重要配置文件
- ✅ 限制敏感数据访问
- ✅ 确保代码审查流程
- ✅ 防止意外删除

---

## 🔐 GitHub 仓库保护设置

### 1️⃣ 分支保护规则（Branch Protection Rules）

#### 保护 main 分支

访问路径：
```
https://github.com/rao5201/chxw-official/settings/branches
```

**配置项**：

| 设置项 | 状态 | 说明 |
|--------|------|------|
| Require a pull request before merging | ✅ 启用 | 禁止直接 push 到 main |
| Require approvals | ✅ 启用 (1 人) | 需要至少 1 人审查 |
| Dismiss stale pull request approvals | ✅ 启用 | 新提交使审查失效 |
| Require status checks to pass | ✅ 启用 | CI 检查必须通过 |
| Require branches to be up to date | ✅ 启用 | 分支必须最新 |
| Require conversation resolution | ✅ 启用 | 解决所有评论 |
| Include administrators | ⚠️ 可选 | 是否适用于管理员 |
| Allow force pushes | ❌ 禁止 | 禁止强制推送 |
| Allow deletions | ❌ 禁止 | 禁止删除分支 |

#### 配置步骤
```
1. 访问 Settings → Branches
2. 点击 "Add branch protection rule"
3. Branch name pattern: main
4. 勾选上述保护选项
5. 点击 "Create"
```

---

### 2️⃣ 仓库可见性设置

#### 当前状态
- **仓库类型**: Public（公开）
- **可见范围**: 所有人可浏览
- **修改权限**: 仅仓库所有者

#### 修改为私有仓库（可选）

如果需要完全保密：
```
1. 访问 Settings → General
2. 滚动到底部 "Danger Zone"
3. 点击 "Change visibility"
4. 选择 "Make private"
5. 确认操作
```

⚠️ **注意**: 
- 私有仓库后，GitHub Pages 仍可免费使用
- 但公开链接将无法访问
- 仅授权用户可浏览代码

---

### 3️⃣ 敏感文件保护

#### 创建 .gitignore 文件

```gitignore
# === 敏感配置文件 ===
# 数据库凭证
.env
.env.local
.env.production
*.env

# API 密钥
api_keys.txt
secrets.json
credentials.json

# 本地配置
.DS_Store
Thumbs.db
*.log
*.tmp

# 编辑器文件
.vscode/
.idea/
*.swp
*.swo

# 临时文件
tmp/
temp/
.cache/

# 数据库备份
*.sql.backup
*.db
*.sqlite

# 上传的敏感文档
passwords.txt
accounts.json
```

#### 创建 SECURITY.md 安全策略

```markdown
# 🔒 安全策略 (Security Policy)

## 报告安全问题

如果您发现本项目存在安全漏洞，请：

1. **不要** 在公开 Issues 中报告
2. 发送邮件至：rao5201@126.com
3. 等待确认和修复

## 支持版本

| 版本 | 支持状态 |
|------|----------|
| v1.0.x | ✅ 安全更新支持 |

## 安全措施

- ✅ 分支保护
- ✅ 代码审查
- ✅ CI/CD 检查
- ✅ 敏感信息加密

## 联系人

- 邮箱：rao5201@126.com
- GitHub: @rao5201
```

---

### 4️⃣ 访问权限管理

#### 协作者管理

访问路径：
```
https://github.com/rao5201/chxw-official/settings/access
```

**权限级别**：

| 角色 | 权限 | 适用场景 |
|------|------|----------|
| Read | 只读 | 查看代码，不能修改 |
| Triage | 管理 Issues | 管理问题，不能改代码 |
| Write | 写入 | 可推送代码到非保护分支 |
| Maintain | 维护 | 除删除仓库外的所有权限 |
| Admin | 管理员 | 完全控制 |

**建议配置**：
- 所有者：rao5201（完全控制）
- 协作者：根据需要添加，默认 Read 权限

#### 添加协作者步骤
```
1. Settings → Collaborators
2. 点击 "Add people"
3. 输入 GitHub 用户名或邮箱
4. 选择权限级别
5. 发送邀请
```

---

### 5️⃣ 代码审查流程

#### Pull Request 模板

创建 `.github/PULL_REQUEST_TEMPLATE.md`：

```markdown
## 📝 变更说明

请描述此 PR 的目的和变更内容：

## 🔗 关联 Issue

- Fixes #

## ✅ 检查清单

- [ ] 代码已测试
- [ ] 文档已更新
- [ ] 无敏感信息泄露
- [ ] 符合代码规范

## 📸 截图（如适用）


```

#### 审查要求
- 至少 1 人审查
- 所有评论必须解决
- CI 检查必须通过
- 禁止跳过审查

---

### 6️⃣ 敏感数据扫描

#### GitHub Secret Scanning

启用路径：
```
Settings → Security → Secret scanning
```

**启用选项**：
- ✅ Secret scanning
- ✅ Push protection
- ✅ Alert notifications

#### 功能说明
- 自动检测提交的 API 密钥
- 阻止包含密钥的推送
- 发送安全警报

---

### 7️⃣ 依赖项安全

#### Dependabot 配置

创建 `.github/dependabot.yml`：

```yaml
version: 2
updates:
  # 检查 npm 依赖
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
    open-pull-requests-limit: 5
    
  # 检查 GitHub Actions
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: "weekly"
```

#### 功能说明
- 自动检测过时依赖
- 发现安全漏洞自动提醒
- 创建更新 PR

---

### 8️⃣ 数据库安全

#### Supabase 密钥管理

**当前配置**：
```javascript
const SUPABASE_URL = "https://bafeelbyfmsjspapvtzr.supabase.co";
const SUPABASE_KEY = "sb_publishable_Vsm5CYpOSny-eYcZVEVaeA_JbGjPd-Z";
```

⚠️ **安全说明**：
- ✅ 使用的是 Publishable Key（公开密钥）
- ✅ 仅具有只读权限
- ✅ 无法修改或删除数据
- ✅ 适合前端使用

**禁止事项**：
- ❌ 不要提交 Service Role Key
- ❌ 不要提交管理员密码
- ❌ 不要提交数据库直连密码

#### RLS 行级安全策略

在 Supabase 中启用 RLS：

```sql
-- 启用新闻表 RLS
ALTER TABLE news ENABLE ROW LEVEL SECURITY;

-- 创建公开读取策略
CREATE POLICY "公开读取新闻" ON news
  FOR SELECT
  USING (is_published = true);

-- 启用产品表 RLS
ALTER TABLE products ENABLE ROW LEVEL SECURITY;

-- 创建公开读取策略
CREATE POLICY "公开读取产品" ON products
  FOR SELECT
  USING (is_published = true);

-- 启用工具表 RLS
ALTER TABLE tools ENABLE ROW LEVEL SECURITY;

-- 创建公开读取策略
CREATE POLICY "公开读取工具" ON tools
  FOR SELECT
  USING (is_published = true);
```

---

### 9️⃣ 备份策略

#### 自动备份配置

创建 `.github/workflows/backup.yml`：

```yaml
name: Weekly Backup

on:
  schedule:
    - cron: '0 0 * * 0'  # 每周日午夜
  workflow_dispatch:

jobs:
  backup:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          fetch-depth: 0
      
      - name: Create backup archive
        run: |
          tar -czf backup-$(date +%Y%m%d).tar.gz .
      
      - name: Upload backup
        uses: actions/upload-artifact@v4
        with:
          name: backup
          path: backup-*.tar.gz
```

#### 备份内容
- ✅ 所有源代码
- ✅ 文档文件
- ✅ 配置文件
- ✅ Git 历史记录

---

### 🔟 审计日志

#### 启用审计日志

访问路径：
```
Settings → Security → Audit log
```

**记录内容**：
- 仓库访问记录
- 代码推送记录
- 设置变更记录
- 权限变更记录
- 协作者操作记录

**保留期限**：
- GitHub Enterprise: 永久
- GitHub Free: 90 天

---

## 📋 安全检查清单

### 仓库设置
- [ ] 分支保护规则已配置
- [ ] main 分支已保护
- [ ] 禁止强制推送
- [ ] 禁止删除分支
- [ ] 需要 PR 审查

### 访问控制
- [ ] 协作者权限已审核
- [ ] 无多余管理员
- [ ] 外部协作者已审查

### 代码安全
- [ ] .gitignore 已配置
- [ ] 无敏感文件提交
- [ ] Secret scanning 已启用
- [ ] Dependabot 已配置

### 数据库安全
- [ ] 仅使用 Publishable Key
- [ ] RLS 策略已启用
- [ ] 无 Service Role Key 泄露

### 备份与审计
- [ ] 自动备份已配置
- [ ] 审计日志已启用
- [ ] 定期审查日志

---

## 🚨 应急响应

### 发现敏感信息泄露

1. **立即删除敏感文件**
```bash
git rm --cached path/to/sensitive/file
git commit -m "remove sensitive file"
git push
```

2. **清理 Git 历史**（如已提交）
```bash
# 使用 BFG Repo-Cleaner
java -jar bfg.jar --delete-files sensitive-file.txt
```

3. **轮换密钥**
   - 修改 Supabase 密钥
   - 更新所有使用位置
   - 通知相关人员

4. **审查访问日志**
   - 检查谁访问了泄露文件
   - 评估影响范围

### 未授权访问

1. 立即修改密码
2. 启用双因素认证
3. 审查协作者列表
4. 撤销可疑访问令牌
5. 查看审计日志

---

## 📞 安全联系人

| 角色 | 联系方式 |
|------|----------|
| 仓库所有者 | rao5201@126.com |
| GitHub 支持 | https://support.github.com |
| 安全报告 | 发送邮件至 rao5201@126.com |

---

## 📚 相关资源

- [GitHub 分支保护文档](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/about-protected-branches)
- [GitHub 安全功能](https://docs.github.com/en/code-security)
- [Supabase RLS 文档](https://supabase.com/docs/guides/auth/row-level-security)
- [Secret Scanning](https://docs.github.com/en/code-security/secret-scanning)

---

**配置完成时间**: 2026-04-04  
**安全级别**: ✅ 标准保护  
**下次审查**: 2026-07-04（3 个月后）

---

© 2026 茶海虾王 (CHXW) - 安全配置文档
