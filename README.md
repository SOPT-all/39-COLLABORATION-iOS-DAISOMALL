# 39-COLLABORATION-iOS-DAISOMALL
39기 PLAY SOPT 합동 세미나 iOS 1조 다이소몰 🏬

<br>

##  iOS Developer

| [**임성환**](https://github.com/limtjdghks) | [**김보영**](https://github.com/Eda3399) |
| :---: | :---: |
| <img src="https://github.com/user-attachments/assets/855b9e1e-9852-490c-9cee-d3e07e61668c" width="200"> | <img src="https://github.com/user-attachments/assets/151311c6-83c8-441b-a89e-b142fe5e304e" width="200"> | 
| `iOS Lead` | `iOS Developer` | 
| 담당 기능 | 담당 기능 |

<br>

## 🛠️ Library & Stack

### Language & UI Framework

![Swift](https://img.shields.io/badge/Swift-F05138?style=for-the-badge&logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-007AFF?style=for-the-badge&logo=swift&logoColor=white)

### Architecture

![MVVM](https://img.shields.io/badge/MVVM-000000?style=for-the-badge&logo=swift&logoColor=white)

### Network


### Library


### Collaboration

![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)
![Figma](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)
![Notion](https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=notion&logoColor=white)

<br>


## 🌱 Git Flow

### Branch Strategy

`main` 브랜치를 기본 브랜치로 사용하며, 모든 기능 개발은 `main`에서 분기한 개별 브랜치에서 진행합니다.

<img width="327" height="154" alt="gitbranch" src="https://github.com/user-attachments/assets/a0913284-0ea1-44f2-aef0-fce422b11dcf" />

<br>

```text
main ───────────────── 통합 브랜치 (직접 push 금지)
  ├── feat/#1 ─────── 기능 개발 브랜치 (Issue 기반)
  ├── feat/#2 ─────── 기능 개발 브랜치 (Issue 기반)
  └── hotfix/#3 ───── 긴급 버그 수정 브랜치
```

### Branch Convention

| Branch | Description | Direct Push |
| :--- | :--- | :---: |
| `main` | 기본 통합 브랜치. PR을 통해서만 변경 사항 반영 | ❌ |
| `feat/*` | 기능 개발 브랜치. `main`에서 분기 | ✅ |
| `hotfix/*` | 긴급 버그 수정 브랜치. `main`에서 분기 | ✅ |

### Branch Naming

브랜치 이름은 GitHub Issue 번호를 기준으로 작성합니다.

`{prefix}/#{이슈번호}`

**Example**

```text
feat/#1
feat/#2
hotfix/#3
```

### Workflow

1. GitHub Issue를 생성하고 작업 단위를 정의합니다.
2. 최신 `main` 브랜치를 기준으로 작업 브랜치를 생성합니다.
3. 생성한 브랜치에서 기능 구현 및 수정 작업을 진행합니다.
4. 작업 완료 후 `main` 브랜치를 대상으로 Pull Request를 생성합니다.
5. 팀원들의 코드 리뷰 및 수정 사항을 반영합니다.
6. 리뷰가 완료되면 `main` 브랜치에 Merge합니다.

### Collaboration Rules

- **`main` 브랜치에서 직접 작업하거나 push하지 않습니다.**
- 작업 전 원격 `main` 브랜치의 변경 사항을 확인하고 최신 상태를 반영합니다.
- Issue와 Pull Request는 가능한 한 작은 단위로 나누어 작성합니다.
- 코드 충돌을 최소화하기 위해 각자 담당하는 폴더와 파일을 중심으로 작업합니다.
- 다른 팀원의 파일을 수정해야 하는 경우 사전에 공유합니다.
- 충돌이 발생하면 관련 팀원과 소통하여 해결한 후 Merge합니다.

<br>

## 📣 Convention

### Commit Message

커밋 메시지는 다음 형식을 사용합니다.

`{prefix}: 작업내용 (#이슈번호)`

**Example**

```text id="e0h5wb"
feat: 로그인 기능 추가 (#12)
fix: 로그인 예외 처리 버그 수정 (#12)
docs: API 명세 업데이트 (#12)
design: 랜딩 뷰 구현 (#12)
refactor: 로그인 처리 로직 리팩토링 (#12)
```

### Commit Tag

| Tag | Description |
| :--- | :--- |
| `feat` | 새로운 기능 추가 |
| `fix` | 버그 수정 |
| `docs` | README 등 문서 수정 |
| `design` | UI/UX 구현 |
| `refactor` | 기능 변경 없이 코드 내부 구조 리팩토링 |
| `test` | 단위 테스트, 통합 테스트 추가 및 테스트 코드 수정 |
| `chore` | 라이브러리 버전 수정, 패키지 관리 등 |
| `comment` | 주석 추가 및 수정 |
| `hotfix` | 배포된 버전에서 발생한 긴급 버그 수정 |
| `rename` | 파일, 클래스 등의 이름 변경 |
| `remove` | 파일, 클래스 등의 삭제 |
| `cicd` | CI/CD 관련 설정 |
| `add` | 파일 및 에셋 추가 |

### Commit Rules

1. 태그는 반드시 **소문자**로 작성합니다.
2. 커밋 메시지의 작업 내용은 **한글**로 작성합니다.
3. 작업 내용을 명확하게 알 수 있도록 간결하게 작성합니다.
4. 하나의 커밋에는 가능한 한 하나의 논리적인 작업 단위를 포함합니다.
5. 커밋 메시지 끝에 관련 GitHub Issue 번호를 작성합니다.

<br>

## 📁 Foldering

SwiftUI와 MVVM 아키텍처를 기반으로 기능별 폴더를 분리하고, 공통 기능과 리소스를 별도로 관리합니다.

```text id="8sb260"
├── 📁 APP
│   └── 📃 DaisoMall_iOSApp.swift
├── 📁 Core
│   ├── 📁 Extension
│   ├── 📁 Navigation
│   └── 📁 Network
│       ├── 📁 Base
│       ├── 📁 DTO
│       └── 📁 Service
├── 📁 Features
│   └── 📁 Home
│       ├── 📁 Model
│       ├── 📁 View
│       │   └── 📃 ContentView.swift
│       └── 📁 ViewModel
├── 📁 Resources
│   ├── 📃 Assets.xcassets
│   └── 📁 Fonts
└── 📁 Shared
    ├── 📁 Component
    └── 📁 DesignSystem
```
