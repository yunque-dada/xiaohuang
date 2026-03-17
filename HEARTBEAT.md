# HEARTBEAT.md

## 定时心跳任务（每小时自动检查）

**执行时间：** 每小时一次（08:00-23:00）

### 检查清单

| 时间 | 检查项 | 操作 |
|------|--------|------|
| 08:00 | 服务器状态 | ss -tln 检查3000/8608端口 |
| 08:00 | 待办事项 | 检查MEMORY.md |
| 12:00 | 服务器状态 | 快速检查 |
| 20:00 | 服务器状态 | 全面检查 |
| 20:00 | 记忆整理 | 更新当日记录 |

### 自我进化内容（每次心跳执行）

**1. 错误自检**
- 检查上一次执行是否有错误
- 记录到 .learnings/ERRORS.md

**2. 技能使用复盘**
- 这次用了哪些技能？
- 效果如何？
- 有没有更好的技能？

**3. 知识更新**
- 有没有学到新知识？
- 需要更新到 memory/ 吗？

**4. 记忆维护**
- 回顾最近3天的memory/
- 把重要的晋升到MEMORY.md

### 执行流程

```
心跳触发
    ↓
1. 检查服务器端口（3000/8608）
    ↓
2. 自我进化（每5小时执行）
   ├── 错误自检 → 记录到.learnings/
   ├── 技能复盘 → 效果评估
   └── 知识更新 → 更新memory/
    ↓
3. 记忆维护
   └── 回顾3天内存活 → 晋升重要到MEMORY.md
    ↓
4. 汇报状态（如有异常）
```

### 定时自我进化（每5小时）

```bash
# 创建自我进化脚本
wget -O /tmp/self_evolution.sh https://raw.githubusercontent.com/yunque-dada/xiaohuang/master/self_evolution.sh

# 添加crontab（每5小时执行）
echo "0 */5 * * * /tmp/self_evolution.sh" >> /var/spool/cron/crontabs/root
```

### 不在23:00-08:00执行心跳（休息时间）

**每次收到用户消息时，自动判断任务类型并触发相应技能：**

### 任务类型 → 技能映射

| 任务类型 | 判断标准 | 使用技能 |
|----------|----------|----------|
| **简单任务** | 事实、单步操作、查询 | 直接回答，无需技能 |
| **复杂推理** | 多步骤、逻辑分析 | thought-based-reasoning |
| **系统化思考** | 需要调整思路、流程分析 | sequential-thinking |
| **自我复盘** | 分析自身、错误反思 | self-reflecting-chain |
| **设计评审** | 方案、代码、架构决策 | multi-agent-brainstorming |
| **多角度分析** | 需要不同视角、决策选择 | meta-cognition-parallel |
| **写提示词** | Prompt工程 | prompt-engineering-patterns |

---

## 🔧 技能清单检查表

**每次动手前必须检查：能用哪个技能？**

| 场景 | 必须检查的技能 | 优先级 |
|------|----------------|--------|
| **搜索信息** | baidu-search, multi-search-engine, tavily-search | 高 |
| **看图片** | minimax-understand-image + minimax-web-search | 高 |
| **写飞书文档** | feishu-doc | 高 |
| **做设计/UI** | superdesign | 高 |
| **总结内容(URL/PDF)** | summarize | 高 |
| **GitHub操作** | github-cli, github-actions-generator | 高 |
| **自动化任务** | automation-workflows | 中 |
| **安全检查** | security-best-practices | 中 |

---

## 🧠 自我改进检查（必须！）

**每次任务后必须检查：**

| 检查项 | 技能 | 操作 |
|--------|------|------|
| **命令失败？** | self-improving-agent | 记录到 .learnings/ERRORS.md |
| **用户纠正？** | self-improving-agent | 记录到 .learnings/LEARNINGS.md |
| **发现更好方法？** | self-improving-agent | 记录最佳实践 |
| **重复问题？** | self-improving-agent | 标记 recurring |

---

## 📊 技能使用报告（每次回答后！）

**格式模板：**
```
💡 技能使用报告
━━━━━━━━━━━━━━━━
✅ 本次使用：[技能名称]
📊 效果：[反馈如何]
💡 可改进：[如何更棒]
```

**每次回答用户后都要加！**

---

## ⚡ 快速决策流程

```
收到任务
    ↓
1. 复杂吗？ → 是 → 思维链
    ↓ 否
2. 需要搜索？ → 是 → 用搜索技能
    ↓ 否
3. 看图片？ → 是 → minimax-understand-image
    ↓ 否
4. 写文档？ → 是 → feishu-doc
    ↓ 否
5. 做设计？ → 是 → superdesign
    ↓ 否
6. 直接回答
    ↓
回答后 → 加技能使用报告 → 主公反馈 → 记录改进
```

---

## 🔍 ClawHub 搜索规则（重要！）

**遇到以下情况，必须主动去 ClawHub 搜索技能：**

| 情况 | 操作 |
|------|------|
| 不知道用什么技能 | clawdhub search 关键词 |
| 现有技能不够用 | clawdhub search 需求描述 |
| 想找新能力 | clawdhub search 功能名 |

---

## 汇报任务

**不再汇报 GitHub 热门项目**，改为汇报其他内容。

### 待确定汇报内容：
- 等待用户指定汇报主题（如：河源本地资讯、天气、新闻、行业动态等）

### 注意：
- 汇报时间仅在 08:00-23:00
- 需要用户指定具体的汇报内容和数据来源

---

## 📋 每日自我检查（每天一次）

**检查时间**：每天首次 heartbeat 时

**检查内容**：

| 检查项 | 操作 |
|--------|------|
| 1. 记忆文件 | 检查昨天有没有没完成的任务 |
| 2. 待办事项 | 查看 MEMORY.md 里的待办 |
| 3. 问题复盘 | 想想今天有没有遇到问题 |
| 4. 技能改进 | 有没有可以优化的地方 |

---

## 🔌 连接保持（每10分钟）

**目的**：防止飞书连接因长时间不活动断开

**检查内容**：
- 定时发送轻量级消息保持连接
- 仅在 08:00-23:00 执行
- 消息内容：简短的日常问候或状态更新

**实现方式**：
- OpenClaw heartbeat 机制
- 每 10 分钟检查一次
- 如果超过 5 分钟没收到用户消息，发送心跳

---

## ⚙️ 后台自动安装技能（每5分钟）

**目的**：后台自动安装 ClawHub Top 100 技能

**检查方式**：
- 每 5 分钟检查一次
- 仅在 08:00-23:00 执行
- 检查待安装列表，安装下一个

**待安装技能列表**：
```
sonoscli, stock-analysis, clawnotes, desktop-control, gmail, blogwatcher, imap-smtp-email, outlook-graph, web-search-exa, youtube-api-skill, stock-market-pro, caldav-calendar, markdown-converter, stripe, agentmail, linear, vercel, cloudflare, playwright-mcp, apple-notes, google-slides, salesforce, webhook 等
```

**实现方式**：
- 在 heartbeat 中执行
- 每次安装一个，如果成功则记录到已安装列表
- 如果遇到 Rate Limit，等待后重试

**记录位置**：memory/2026-03-11.md

**记录到**：memory/YYYY-MM-DD.md
