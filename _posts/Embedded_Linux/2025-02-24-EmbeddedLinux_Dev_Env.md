---
layout: single
title:  "[Linux System] 임베디드 리눅스 개발 환경 구축"
categories: 
  - embedded
  - embedded_linux
tag: [linux, EmbeddedLinux]
author_profile: false
typora-root-url: ../
# search: false
---
# 1. Host System 구축

## VirtualBox Host System
Target board 의 로그를 확인하고, Target board 를 build 하기 위한 host system 을 구축한다.

### Windows - VirtualBox 간 파일 공유

VirtualBox 설정 > 공유 폴더

```bash
$ sudo cp -rf /media/sf_share/res .

$ sudo chown -R user res  # 소유자를 user 로 변경
$ sudo chgrp -R user res  # 소유 그룹을 user 로 변경

$ tar zxvf ~/xxx.tar.gz   # 압축 해제

# manual, help
$ man cp
$ help cd
```

# 2. Target System 구축

## 연결 구조
[Target] - [UART(BCM2837)] - [UART-to-USB Converter] - [USB] - [PC(Host)]
[Target] - [Ethernet] - [PC(Host)]

## (Host) Serial 설정
```bash
$ sudo minicom -s  # serial 설정
$ sudo minicom     # 실행
```
## (Target) Serial 설정
U-Boot 명령 프롬프트 진입 (count가 0이 되기 전에 부트로더 명령 프롬프트 진입)

## (Target) 환경변수 설정
```bash
U-Boot> printenv
U-Boot> setenv
U-Boot> saveenv
```

## (Host) Network Setting
IP, Netmask 설정
192.168.10.3
ifconfig

## (Target) Network Setting
192.168.10.2

## TFTP를 이용한 파일 전송
Host > Target 으로 이미지 전송
1. 커널 이미지
2. DTB 이미지
3. RFS 이미지

Target 시스템에서 kernel image 들을 특정 주소로 download

## (Target) boot 설정
```bash
U-Boot> setenv bootcmd '~'   # 리눅스 부팅시 수행되는 command
U-Boot> setenv bootargs '~'  # U-Boot 가 kernel로 전달할 옵션 (kernel parameter)
```
bootargs 에는 RFS 의 정보가 커널로 전달되어야 한다.

부트로더 > 커널 이미지, RFS 이미지 load > 커널 부팅 > RFS mount

## (Host) Target system 용 program build
bashrc 에 cross-compiler 경로 추가
aarch64-linux-gnu-gcc

## NFS 사용
공유폴더 개념
Host : NFS Server
Target : NFS Client, NFS 공유 directory 를 mount 해야 함
