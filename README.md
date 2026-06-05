# m16khb

에이전트 도구, CLI/MCP 시스템, 백엔드 인프라를 만듭니다.

한국어로 일하고 기록하는 것을 선호합니다. 요즘은 Codex와 Claude Code 양쪽에서 같은 방식으로 쓸 수 있는 개발 도구, 긴 작업을 버티는 context compression, 그리고 에이전트가 이전 작업을 잃지 않게 하는 memory system에 관심이 많습니다.

## 지금 관심 있는 것

- Codex / Claude Code 공용 에이전트 하네스
- CLI, MCP, daemon 기반 로컬 자동화
- 긴 에이전트 작업을 위한 context compression / memory system
- Go와 TypeScript 기반 백엔드 구조
- 테스트와 실제 실행 증거를 남기는 개발 흐름

## 공개 프로젝트

| Project | What it is |
| --- | --- |
| [agent-harness](https://github.com/m16khb/agent-harness) | Codex와 Claude Code에서 같이 쓰는 개인 에이전트 하네스 |
| [headroom](https://github.com/m16khb/headroom) | LLM 입력을 줄이는 token compression library / proxy / MCP server |
| [claude-mem](https://github.com/m16khb/claude-mem) | 에이전트 세션 사이의 작업 맥락을 이어주는 memory system |
| [cc-essential](https://github.com/m16khb/cc-essential) | Claude Code용 atomic commit / conventional commit plugin |
| [mcp-memory-service](https://github.com/m16khb/mcp-memory-service) | semantic search를 지원하는 MCP memory service |
| [go-boilerplate](https://github.com/m16khb/go-boilerplate) | Go/Gin clean architecture 학습용 boilerplate |

## 기술 스택

`Go` `TypeScript` `Python` `Node.js` `NestJS` `MCP` `CLI tools` `GitHub Actions`

## 지금 만드는 방향

AI와 함께 개발할 때 실제로 도움이 되는 작은 인프라를 만듭니다. 맥락을 보존하고, 동작을 검증하고, 여러 agent host에서 같은 결과를 내는 도구를 선호합니다.
