#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
readme="$root/README.md"

fail() {
  printf 'profile-readme validation failed: %s\n' "$1" >&2
  exit 1
}

test -s "$readme" || fail "README.md is missing or empty"

content="$(cat "$readme")"

required=(
  "# m16khb"
  "에이전트 도구"
  "한국어"
  "## 지금 관심 있는 것"
  "## 개발 중"
  "## 공개 프로젝트"
  "## 기술 스택"
  "Backend & API"
  "Infra & Ops"
  "Data & Queue"
  "Cloud & Automation"
  "agent-harness"
  "https://bubblechat.ai"
  "https://tingle.chat"
  "백엔드"
  "인프라"
  "Go"
  "Gin"
  "GORM"
  "MySQL"
  "NestJS"
  "TypeORM"
  "Kubernetes"
  "GitOps"
  "Argo CD"
  "n8n"
  "Swagger"
  "Elasticsearch"
  "Grafana"
  "AWS"
  "NCP"
  "NKS"
  "ECS"
  "Kafka"
  "BullMQ"
  "img.shields.io"
  "Omo"
  "Rust"
  "Tauri"
  "React"
  "Vite"
  "Bun"
  "PostgreSQL"
  "Drizzle"
  "galpi"
  "mota"
  "안정적으로 운영"
)

for needle in "${required[@]}"; do
  if [[ "$content" != *"$needle"* ]]; then
    fail "missing required content: $needle"
  fi
done

if grep -Eiq '(gho_[A-Za-z0-9_]+|github_pat_[A-Za-z0-9_]+|api[_-]?key|password|secret|private repo|비공개)' "$readme"; then
  fail "README.md contains secret-like or private-only wording"
fi

if grep -Eq '^(I build|Building practical|Portable agent|Context compression)' "$readme"; then
  fail "README.md is still English-first"
fi

if grep -Fq "공개 프로젝트는 과장 없이 검증 가능한 것만 남깁니다" "$readme"; then
  fail "README.md contains removed defensive phrasing"
fi

if grep -Fq "github-profile-summary-cards.vercel.app" "$readme"; then
  fail "README.md contains profile summary image card"
fi

if ! grep -Fq "https://github.com/m16khb/agent-harness" "$readme"; then
  fail "missing GitHub link for agent-harness"
fi

if ! grep -Fq "https://github.com/m16khb/galpi" "$readme"; then
  fail "missing GitHub link for galpi"
fi

if ! grep -Fq "https://github.com/m16khb/mota" "$readme"; then
  fail "missing GitHub link for mota"
fi

if ! grep -Eq '\[[*]*bubblechat\.ai[*]*\]\(https://bubblechat\.ai\)' "$readme"; then
  fail "missing hyperlink for bubblechat.ai"
fi

if ! grep -Eq '\[[*]*tingle\.chat[*]*\]\(https://tingle\.chat\)' "$readme"; then
  fail "missing hyperlink for tingle.chat"
fi

extra_project_repos=(
  headroom
  claude-mem
  cc-essential
  mcp-memory-service
  go-boilerplate
  glm-ensemble
  npm-library
)

for repo in "${extra_project_repos[@]}"; do
  if grep -Fq "https://github.com/m16khb/$repo" "$readme"; then
    fail "unexpected public project link remains: $repo"
  fi
done

line_backend="$(grep -n 'Backend & API' "$readme" | head -1 | cut -d: -f1)"
line_infra="$(grep -n 'Infra & Ops' "$readme" | head -1 | cut -d: -f1)"
line_data="$(grep -n 'Data & Queue' "$readme" | head -1 | cut -d: -f1)"
line_cloud="$(grep -n 'Cloud & Automation' "$readme" | head -1 | cut -d: -f1)"
if ! (( line_backend < line_infra && line_infra < line_data && line_data < line_cloud )); then
  fail "tech stack groups are not in the expected scan order"
fi

printf 'profile-readme validation passed\n'
