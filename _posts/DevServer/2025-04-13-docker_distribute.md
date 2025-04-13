---
layout: single
title:  "[Docker] STM32 Build Container Distribution"
categories:
  - docker
tags: [docker, stm32, embedded]
author_profile: false
typora-root-url: ../
---

> A practical guide for using a prebuilt Docker container to build STM32 firmware on Windows with VSCode and Docker.

## 🐳 1. Install Docker on Windows

- Download Docker Desktop:  
  [Get Docker for Windows](https://docs.docker.com/get-started/get-docker/)
- Optional Korean blog reference:  
  [Blog Guide (Korean)](https://herojoon-dev.tistory.com/254)
- **Restart your PC** after installation.

## 📦 2. Load the Prebuilt STM32 Image

Download and import the prebuilt image (provided as `.tar`):

```bash
docker load -i ty_stm32_v0.0.1.tar
```

## 🚀 3. Run the STM32 Build Container

```bash
docker run -it --rm ty_stm32 /bin/bash
```

If you'd like to keep the container running in background (for attaching from VSCode), remove `--rm`:

```bash
docker run -it --name ty_stm32 ty_stm32 /bin/bash
```

## 🧠 4. Set Up VSCode for Docker-Based Development

### 🧹 Install Extensions

- **Remote Development** (`ms-vscode-remote.vscode-remote-extensionpack`)
- **Tasks Explorer** (`spmeesseman.vscode-taskexplorer`)

### 🔗 Attach VSCode to Running Container

- From VSCode Command Palette (`Ctrl + Shift + P`):
  ```
  Dev Containers: Attach to Running Container...
  ```
- Select your running container (e.g., `ty_stm32_container`)

## 🔐 5. Configure SSH for GitHub Access (inside container)

Inside the container terminal:

```bash
ssh-keygen -t ed25519
cat ~/.ssh/id_ed25519.pub
```

Copy the printed key and add it to your GitHub account:  
[GitHub → Settings → SSH and GPG Keys](https://github.com/settings/keys)

(Optional: Add SSH config for convenience)

```bash
vim ~/.ssh/config
```

Example content:

```
Host github.com
  User git
  IdentityFile ~/.ssh/id_ed25519
```

Now you can clone private repositories:

```bash
git clone git@github.com:<your-username>/<your-repo>.git
```

## ⚙️ 6. Build Firmware from VSCode

- Open the firmware project directory
- Use **Tasks Explorer** (`Ctrl + Shift + P` → `Tasks: Run Task`)
- Run the appropriate build task (e.g., `Build Firmware`)

## 📥 7. Retrieve Build Artifacts (e.g., .uf2)

Use the provided `pull_uf2.bat` script to copy build results from the container to your Windows host:

```batch
@echo off
set CONTAINER=ty_stm32_keyboard
set REMOTE_PATH=/root/TY/keyboard-h7s/firmware/baram-45k-h7s-fw/build
set LOCAL_PATH=%~dp0output

mkdir %LOCAL_PATH%
docker cp %CONTAINER%:%REMOTE_PATH% %LOCAL_PATH%
start "" %LOCAL_PATH%\build
pause
```

Place this script next to your working folder and run after each build.

## 🔌 8. Flash and Debug Locally

Use [STM32CubeProgrammer](https://www.st.com/en/development-tools/stm32cubeprog.html) on Windows:

```bash
STM32_Programmer_CLI.exe ^
  -c port=SWD reset=HWrst freq=4000 ^
  -w .\baram-qmk-8k-boot.elf -v -g
```

Make sure the board is connected via ST-Link and in boot mode if needed.