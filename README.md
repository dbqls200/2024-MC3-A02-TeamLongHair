# Know-D: 문서 연관성 시각화 아카이브

![Know-D](https://github.com/user-attachments/assets/360f5372-0dba-46bb-9dde-566e08282f18)

개발자들이 웹 문서 간의 연관성을 쉽게 시각화하고 아카이빙할 수 있는 서비스

</br>

## 개발배경 및 목적

개발자들은 주로 웹 서핑을 통해 학습하지만, 수많은 개발 문서를 동시에 참고하다 보면 어디서 시작했는지, 무엇 때문에 현재 문서에 도달했는지 혼란을 겪기 쉽습니다. 이러한 혼란을 해소하기 위해, 이 서비스는 개발되었습니다. 이 서비스를 통해 사용자는 다시 보고 싶은 문서를 쉽게 아카이빙하고, 아카이빙한 문서들 간의 관계를 한눈에 파악할 수 있으며, 직접 계층을 만들고 색상을 지정하는 등 유저 맞춤형 커스터마이징도 가능합니다.

</br>

## 개발 환경

- Programing Language: Swift
-  OS: macOS 
- Framework: AppKit(NSWindow, NSPanel), SwiftUI
- Data Management: SwiftData
- IDE: Xcode

</br>

## 시스템 구성 및 아키텍처

![system](https://github.com/user-attachments/assets/426e5ded-950f-4a28-8a2d-dabf549bb213)

</br>

## 프로젝트 주요기능 및 구조도

> 프로젝트 주요기능

### 1. 링크 저장
- **목적**: 사용자가 웹 링크, 문서 링크 등을 프로젝트에 저장하고 관리할 수 있도록 합니다.
- **기능 세부 사항**:
  - **프로젝트 관리**: 사용자는 여러 프로젝트를 생성하고, 각 프로젝트 내에서 여러 페이지를 추가하여 링크를 체계적으로 관리할 수 있습니다.
  - **페이지 관리**: 페이지를 생성하거나 삭제할 수 있으며, 페이지별로 관련 링크를 저장하고 정리할 수 있습니다.
  - **링크 관리**: 사용자가 페이지마다 저장한 링크를 모아볼 수 있으며, 링크의 제목, URL, 설명 및 기타 메타데이터를 저장할 수 있습니다.

### 2. 링크 도식화
- **목적**: 사용자가 저장한 링크를 시각적으로 표현하여, 링크 간의 관계를 쉽게 파악할 수 있도록 합니다.
- **기능 세부 사항**:
  - **링크 도식화 생성**: 프로젝트 내 각 페이지에서 링크들 간의 관계를 도식화하여 시각적으로 표현합니다.
  - **드래그 앤 드롭**: 링크 간의 관계를 드래그 앤 드롭 방식으로 쉽게 조정하거나 시각적 배치를 사용자가 직접 편집할 수 있습니다.
  - **실시간 업데이트**: 링크의 추가, 삭제 및 수정 사항이 도식화 화면에 실시간으로 반영되어, 사용자가 최신 상태를 즉시 확인할 수 있습니다.

### 3. 프로젝트 및 페이지 관리
- **목적**: 사용자가 링크를 저장할 프로젝트와 페이지를 관리하고, 사용자의 목적 및 활용도에 따라 프로젝트와 페이지를 구분할 수 있습니다.
- **기능 세부 사항**:
  - **프로젝트 및 페이지 정렬**: 프로젝트는 최근 편집 순으로 정렬되어, 사용자가 최근에 작업한 프로젝트 및 페이지에 쉽게 접근할 수 있습니다.

</br>

> 프로젝트 구조도

이 프로젝트는 사용자가 웹 링크나 문서 링크를 프로젝트와 페이지 단위로 아카이빙하고, 이 링크들 간의 관계를 시각화하여 쉽게 파악할 수 있는 기능을 제공합니다. 전체 구조는 ‘프로젝트 → 페이지 → 링크’ 계층으로 구성되며, 데이터는 SwiftData를 사용하여 관리됩니다.


```
Know-D
├── Extensions
│   └── View+.swift
├── FloatingPanel
│   ├── FloatingPanel.swift
│   ├── FloatingPanelExpandableLayout.swift
│   ├── FloatingPanelModifier.swift
│   ├── FloatingPanelView.swift
│   ├── PanelListView.swift
│   ├── ShortcutSettingView.swift
│   └── VisualEffectView.swift
├── Home
│   ├── HomeView.swift
│   └── ProjectGallery.swift
├── Model
│   ├── LinkModel.swift
│   ├── PageModel.swift
│   └── ProjectModel.swift
├── Project
│   ├── DetailPanel
│   │   ├── CodeBlockView.swift
│   │   ├── ColorCircleView.swift
│   │   ├── ColorView.swift
│   │   ├── DetailPanelView.swift
│   │   ├── IconEnums.swift
│   │   ├── LinkView.swift
│   │   ├── MemoView.swift
│   │   └── TagView.swift
│   ├── LinkPanel
│   │   ├── LinkListView.swift
│   │   └── LinkPanelView.swift
│   ├── Page
│   │   ├── Canvas
│   │   │   ├── CanvasView.swift
│   │   │   ├── DrawNodes.swift
│   │   │   └── LinkNode.swift
│   │   └── PageView.swift
│   └── ProjectView.swift
├── TeamLongHair.entitlements
├── TeamLongHairApp.swift
└── Utils
    ├── AppDelegate.swift
    ├── AppState.swift
    ├── ArrowKey.swift
    └── KeyShortcut.swift
```

## UI 구조

- **홈 화면**: 프로젝트 관리 기능을 제공합니다.
- **프로젝트 화면**: 페이지 관리 기능을 제공합니다.
- **페이지 화면**: 링크 관리 및 링크 도식화 기능을 제공합니다.

## 데이터 관리 - SwiftData

- **로컬 저장**: 프로젝트, 페이지, 링크 데이터를 로컬에서 영구적으로 저장합니다.
- **일관성 유지**: SwiftData 기능을 활용하여 데이터의 일관성을 유지합니다.

## 프로젝트 계층 구조

- **프로젝트**
  - 여러 페이지를 포함하며, 프로젝트의 추가, 삭제, 이름 변경이 가능합니다.
  - 각 프로젝트는 페이지 및 링크 데이터를 관리합니다.

- **페이지**
  - 프로젝트 내에서 특정 주제에 따라 링크를 분류하고 저장할 수 있는 단위입니다.
  - 하나의 프로젝트에는 여러 페이지가 있을 수 있으며, 각 페이지에는 링크가 포함됩니다.

- **링크**
  - 웹사이트나 문서의 URL을 저장하며, 링크 간의 연관성을 도식화하여 표현할 수 있습니다.
  - 각 링크는 태그, 중요도에 따른 색 지정, 간단한 메모 및 코드 블록 데이터와 같은 세부 정보를 포함할 수 있습니다.
 
</br>

## 기대효과 및 활용분야

1. 맥락 기반 학습

&emsp;&emsp; 사용자는 아카이빙한 문서가 저장된 맥락과 문서 간의 연관성을 쉽게 파악하여, 보다 효과적으로 학습할 수 있습니다.

2. 효율적인 문서 관리

&emsp;&emsp; 문서를 프로젝트와 페이지 단위로 체계적으로 정리하여 필요한 정보를 신속하게 찾을 수 있습니다.

3. 연관성 시각화로 발견하는 인사이트

&emsp;&emsp; 사용자는 문서 사이의 관계를 쉽게 파악하고, 숨겨진 패턴이나 인사이트를 발견할 수 있습니다. 

&emsp;&emsp;이를 위해 검색 및 태그 필터링 기능을 추가할 계획입니다.

4. 도식화된 문서 아카이브 공유

&emsp;&emsp; 도식화된 문서들을 서로 공유할 수 있도록 Export 기능을 기획하고 있습니다.

5. 다양한 분야로 확장

&emsp;&emsp; 이 서비스는 개발자를 위한 도구로 시작되었지만, 문서 간 연계성이 중요한 다양한 분야에서도 활용될 수 있습니다.

&emsp;&emsp; 취업 정보를 정리해야 하는 취업준비생, 연구 논문을 관리하는 연구원, 자료를 수집하고 분석하는 작가 및 저널리스트 등

</br>

## 스크린샷

![floating](https://github.com/user-attachments/assets/c068bb91-981f-4705-a8aa-afa3d20c18ec)

플로팅 패널

![drag](https://github.com/user-attachments/assets/842bcfa9-390f-47da-bf4c-9693b464b37c)

드래그 앤 드롭

![detail](https://github.com/user-attachments/assets/4ba2ee08-7452-4413-9dd6-ac5996a0fed6)

태그, 컬러 등 설정

