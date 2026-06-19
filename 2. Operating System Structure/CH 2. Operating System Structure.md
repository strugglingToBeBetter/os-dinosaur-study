## 2.1. 운영체제 서비스

#### 사용자 편의 및 프로그램 실행을 돕는 서비스

- **사용자 인터페이스 (User Interface, UI):** 거의 모든 운영체제는 어떤 형태로든 UI를 제공합니다.
  - **GUI (Graphical User Interface):** 마우스(포인팅 장치), 윈도우 시스템, 메뉴, 키보드를 활용한 인터페이스.
  - **터치스크린 인터페이스 (Touch-Screen Interface):** 스마트폰, 태블릿 등 모바일 기기에서 손가락 제스처(슬라이드, 터치) 및 가상 키보드를 사용하는 인터페이스.
  - **CLI (Command-Line Interface):** 특정 형식과 옵션을 가진 텍스트 명령어를 직접 입력하는 인터페이스.
- **프로그램 실행 (Program Execution):** 시스템은 프로그램을 메모리에 로드(Load)하고 실행(Run)할 수 있어야 합니다. 프로그램은 정상적이든 비정상적이든(오류 표시) 실행을 끝마칠 수 있어야 합니다.
- **I/O 연산 (I/O Operations):** 실행 중인 프로그램은 파일이나 입출력 장치(Network, Disk 등)를 필요로 합니다. 효율성과 보안(보호)을 위해 사용자는 I/O 장치를 직접 제어할 수 없으므로, 반드시 운영체제를 거쳐 I/O를 수행해야 합니다.
- **파일 시스템 조작 (File-System Manipulation):** 프로그램은 파일과 디렉터리를 읽고 써야 하며, 이름으로 파일을 생성/삭제하고, 검색하고, 파일 정보를 나열할 수 있어야 합니다. 권한 관리(Permissions Management)를 통해 접근을 허용하거나 거부하는 기능도 포함됩니다.
- **통신 (Communications):** 한 프로세스가 다른 프로세스와 정보를 교환해야 하는 상황에서 사용됩니다.
  - **공유 메모리 (Shared Memory):** 둘 이상의 프로세스가 메모리의 동일한 영역을 읽고 쓰는 방식.
  - **메시지 전달 (Message Passing):** 운영체제에 의해 미리 정의된 형태의 정보 패킷(Packet)이 프로세스 간에 이동하는 방식.
- **오류 탐지 (Error Detection):** 운영체제는 항상 오류를 탐지하고 수정해야 합니다. 오류는 CPU/메모리 하드웨어(메모리 에러, 정전), I/O 장치(디스크 패리티 에러, 네트워크 연결 실패, 프린터 용지 부족), 사용자 프로그램(산술 오버플로우, 잘못된 메모리 주소 접근 시도) 등 어디서나 발생할 수 있으며, 시스템의 일관성을 위해 적절한 조치(오류 코드 반환, 프로세스 강제 종료, 시스템 멈춤 등)를 취합니다.

#### 시스템 자체의 효율적 운영을 위한 서비스

- **자원 할당 (Resource Allocation):** 다중 프로세스가 동시에 실행될 때, 각각에 자원을 할당해야 합니다. CPU 사이클, 메인 메모리, 파일 저장소 등에는 특수한 할당 코드가 사용되며, 일반 I/O 장치 관리를 위한 요청 및 해제 코드도 존재합니다. (예: CPU 스케줄링 라우틴).
- **로깅 (Logging):** 어떤 사용자가 어떤 종류의 컴퓨터 자원을 얼마나 사용했는지 추적하고 기록합니다. 과금 목적이나 시스템 관리자의 시스템 성능 개선을 위한 통계 자료로 활용됩니다.
- **보호 및 보안 (Protection and Security):** 다중 사용자 또는 네트워크 컴퓨터 시스템에서 정보 자원을 통제합니다.
  - **보호 (Protection):** 시스템 자원에 대한 모든 접근이 통제되도록 보장하는 것 (프로세스 간 간섭 차단).
  - **보안 (Security):** 외부의 잘못된 접근 시도로부터 시스템을 방어하는 것 (사용자 인증, 비밀번호, 네트워크 어댑터 방어, 침입 탐지 로그 기록 등).
  - _"사슬은 가장 약한 고리만큼만 강하다(A chain is only as strong as its weakest link)."_

## 2.2. 사용자 및 운영체제 인터페이스 (User and OS Interface)

### 2.2.1. 명령 인터프리터 (Command Interpreters / Shells)

- 운영체제(Linux, UNIX, Windows 등)에서 사용자가 직접 텍스트 명령을 입력하여 실행할 수 있도록 지원하는 특수한 프로그램입니다.
- 여러 개의 명령 인터프리터를 선택할 수 있는 시스템에서 이를 **쉘(Shell)**이라고 부릅니다. (예: UNIX/Linux의 `bash`, `csh`, `ksh` 등).
- **명령어 구현의 두 가지 접근 방식:**
  1. **내부 코드 방식:** 명령 인터프리터 프로그램 자체 내에 명령어를 실행하는 코드가 포함된 방식. 명령어가 많아질수록 인터프리터 파일의 크기가 커집니다.
  2. **시스템 프로그램 방식 (UNIX/Linux 방식):** 명령 인터프리터는 명령의 의미를 자체적으로 이해하지 못합니다. 단지 사용자가 입력한 명령 단어와 일치하는 이름의 파일(시스템 프로그램)을 메모리로 로드하여 실행할 뿐입니다.
     - 예: `rm file.txt` 입력 시, 인터프리터는 `rm`이라는 파일을 찾아 메모리에 올리고 `file.txt`를 매개변수로 넘깁니다. 이 방식은 인터프리터의 크기를 작게 유지할 수 있으며, 새로운 명령어를 파일 형태로 쉽게 추가할 수 있다는 강력한 장점이 있습니다.

### 2.2.2. 그래픽 사용자 인터페이스 (Graphical User Interface, GUI)

- 데스크톱 메타포(Desktop Metaphor)를 기반으로 창, 메뉴, 아이콘을 활용하여 마우스 등으로 조작하는 직관적인 인터페이스입니다.
- 1970년대 Xerox PARC에서 최초 연구 및 개발(`Xerox Alto`, 1973년)되었고, 1980년대 `Apple Macintosh`를 통해 대중화되었습니다.
- Windows 1.0은 초기 MS-DOS 위에 GUI 레이어를 추가하는 방식으로 시작되었습니다. UNIX/Linux 진영에서도 오픈소스 프로젝트인 `KDE`, `GNOME` 등을 통해 발전해왔습니다.

### 2.2.3. 터치스크린 인터페이스 (Touch-Screen Interface)

- 모바일 기기(스마트폰, 태블릿 등)에 최적화된 인터페이스로, 마우스와 키보드 대신 손가락 제스처(누르기, 스와이프 등)를 사용합니다. (예: Apple iOS의 `Springboard` 인터페이스). 가상 키보드를 화면에 시뮬레이션하여 텍스트 입력을 지원합니다.

### 2.2.4. 인터페이스의 선택 (Choice of Interface)

- **CLI:** 시스템 관리자 및 파워 유저들이 선호합니다. 효율적이고 전 기능에 빠른 접근이 가능하며, 쉘 스크립트(Shell Script, 명령어들을 파일에 기록하여 프로그램처럼 해석·실행하는 방식)를 통해 반복적인 작업을 쉽게 자동화할 수 있습니다.
- **GUI:** 일반 사용자들이 주로 선호합니다. Windows 사용자들은 거의 대부분 GUI 환경을 사용합니다.
- **하이브리드:** macOS의 경우 사용자 친화적인 데스크톱 GUI(Aqua)를 제공하는 동시에, 하부 커널이 UNIX 기반이기 때문에 강력한 command-line 쉘 인터페이스도 함께 제공합니다.

# Chapter 2.3 System Calls

## 시스템 콜(System Call)이란?

시스템 콜은 사용자 프로그램이 운영체제의 기능을 사용하기 위해 커널에게 요청하는 인터페이스이다.

일반 프로그램은 User Mode에서 실행되며 하드웨어나 중요한 시스템 자원에 직접 접근할 수 없다.

따라서 파일 생성, 프로세스 생성, 메모리 할당 등의 작업이 필요하면 반드시 시스템 콜을 통해 운영체제에 요청해야 한다.

---

## 왜 시스템 콜이 필요한가?

만약 모든 프로그램이 하드디스크나 메모리에 직접 접근할 수 있다면

- 다른 프로그램 데이터 손상
- 운영체제 파괴
- 보안 문제

가 발생할 수 있다.

운영체제는 이를 방지하기 위해 커널만 자원에 접근할 수 있도록 설계한다.

---

## 시스템 콜 동작 과정

```text
Application
    ↓
API
    ↓
System Call Interface
    ↓
Kernel
```

예를 들어

```c
fopen("test.txt");
```

를 호출하면

```text
fopen()
 ↓
open() System Call
 ↓
Kernel
 ↓
Disk Access
```

가 수행된다.

---

## 시스템 콜 파라미터 전달 방법

### 1. Register 방식

파라미터를 CPU Register에 저장하여 전달

장점

- 가장 빠름

단점

- 전달 가능한 데이터 양이 제한됨

---

### 2. Memory Block 방식

파라미터들을 메모리에 저장한 후

그 메모리의 주소만 Register에 전달

장점

- 많은 양의 데이터 전달 가능

---

### 3. Stack 방식

파라미터를 Stack에 push

운영체제가 Stack에서 읽음

장점

- 전달 개수 제한이 적음

---

## 시스템 콜 종류

### Process Control

프로세스 생성 및 종료

예시

```c
fork()
exit()
wait()
```

---

### File Management

파일 생성 및 입출력

예시

```c
open()
read()
write()
close()
```

---

### Device Management

장치 제어

예시

```c
ioctl()
```

---

### Information Maintenance

시스템 정보 조회

예시

```c
getpid()
sleep()
alarm()
```

---

### Communications

프로세스 간 통신

예시

```c
pipe()
mmap()
shared memory
```

---

### Protection

권한 제어

예시

```c
chmod()
chown()
umask()
```

---

# Chapter 2.4 System Services

## System Service란?

사용자가 운영체제를 편리하게 사용할 수 있도록 제공되는 프로그램이다.

System Call보다 상위 계층에 존재한다.

---

## System Call과의 차이

System Call

- 커널 기능 요청 인터페이스

System Service

- 시스템 콜을 사용하는 실제 프로그램

예시

```bash
cp file1 file2
```

사용자는 cp를 실행하지만

내부에서는

```c
open()
read()
write()
close()
```

시스템 콜이 호출된다.

---

## 주요 종류

### File Management

파일 및 디렉토리 관리

예)

```bash
cp
mv
rm
mkdir
```

---

### Status Information

시스템 상태 조회

예)

```bash
top
ps
task manager
```

---

### Programming Support

개발 도구 제공

예)

```text
Compiler
Assembler
Debugger
```

---

### Background Services (Daemon)

백그라운드에서 계속 실행되는 서비스

예)

```text
Print Daemon
Network Daemon
```

---

# Chapter 2.5 Linkers and Loaders

## 프로그램이 실행되기 전 과정

소스코드는 바로 실행되지 않는다.

```text
Source Code
 ↓
Compiler
 ↓
Object File
 ↓
Linker
 ↓
Executable File
 ↓
Loader
 ↓
Memory
 ↓
CPU
```

---

## Compiler

소스코드를 기계어로 변환

예)

```c
main.c
```

↓

```text
main.o
```

---

## Object File

아직 실행 불가능한 중간 결과물

다른 파일과 연결되지 않은 상태

---

## Linker

여러 Object File을 연결

예)

```text
main.o
math.o
stdio.o
```

↓

```text
program.exe
```

---

## Loader

실행 파일을 메모리에 적재

예)

```text
Disk
 ↓
Memory
 ↓
Process 생성
```

---

## Relocation

실행 시 실제 메모리 주소를 결정하는 작업

예)

```text
printf()
전역 변수
함수 주소
```

---

# Chapter 2.6 Why Applications Are Operating-System Specific

## 왜 프로그램은 OS에 종속적인가?

Windows에서 만든 exe가 Linux에서 실행되지 않는 이유를 설명하는 챕터

---

## 이유 1 : 시스템 콜 차이

Windows

```c
CreateProcess()
```

Linux

```c
fork()
```

같은 기능이어도 호출 방식이 다르다.

---

## 이유 2 : 라이브러리 차이

Windows

```text
kernel32.dll
```

Linux

```text
libc.so
```

사용하는 라이브러리가 다르다.

---

## 이유 3 : 실행 파일 포맷 차이

Windows

```text
PE
```

Linux

```text
ELF
```

실행 파일 구조 자체가 다르다.

---

## API

Application Programming Interface

개발자가 사용하는 함수 규약

예)

```c
printf()
malloc()
fopen()
```

---

## ABI

Application Binary Interface

컴파일된 바이너리가 지켜야 하는 규칙

포함 내용

- 함수 호출 규약
- 레지스터 사용
- 스택 구조
- 데이터 타입 크기
- 실행 파일 형식

---

## API와 ABI 차이

API

```text
소스코드 수준 인터페이스
```

ABI

```text
바이너리 수준 인터페이스
```

---

# Chapter 2.7 Operating-System Design and Implementation

## 운영체제 설계 목표

### User Goals

사용자 입장

- 사용하기 쉬움
- 빠름
- 안전함
- 신뢰성 있음

---

### System Goals

운영체제 개발자 입장

- 유지보수 용이
- 확장성
- 효율성
- 신뢰성

---

## Mechanism과 Policy

시험에 자주 출제되는 핵심 개념

---

### Mechanism

어떻게 구현할 것인가

How

예)

Priority Scheduler 제공

---

### Policy

무엇을 선택할 것인가

What

예)

어떤 프로세스에 높은 우선순위를 줄 것인가

---

## 왜 분리하는가?

정책은 자주 바뀌지만

메커니즘은 잘 바뀌지 않는다.

따라서 둘을 분리하면 유지보수가 쉬워진다.

---

## Reliability (신뢰성)

시스템이 오랫동안 오류 없이 의도한 대로 동작하는 성질

예)

- 메모리 누수 없음
- 크래시 없음
- 데이터 손상 없음

---

## Portability (이식성)

다양한 하드웨어와 환경에서 쉽게 동작할 수 있는 능력

운영체제 설계의 중요한 목표 중 하나이다.
