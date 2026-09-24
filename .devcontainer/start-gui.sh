#!/bin/bash

export DISPLAY=:1

# 기존 VNC 세션 종료
vncserver -kill :1 2>/dev/null || true

# 기존 X 잠금 파일 제거
rm -rf /tmp/.X1-lock
rm -rf /tmp/.X11-unix/X1

# VNC 설정 디렉터리 생성
mkdir -p "$HOME/.vnc"

# VNC 비밀번호 자동 설정
# TigerVNC는 최대 8글자이므로 "aaaaaa" 사용
echo "aaaaaa" | vncpasswd -f > "$HOME/.vnc/passwd"
chmod 600 "$HOME/.vnc/passwd"

# XFCE 시작 설정
cat > "$HOME/.vnc/xstartup" <<'EOF'
#!/bin/sh

unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS

exec startxfce4
EOF

chmod +x "$HOME/.vnc/xstartup"

# VNC 서버 시작
vncserver :1 \
    -geometry 1280x800 \
    -depth 24 \
    -localhost

# XFCE가 시작될 때까지 대기
sleep 5

# Google Chrome 실행
DISPLAY=:1 google-chrome \
    --no-sandbox \
    --disable-dev-shm-usage \
    --disable-gpu \
    > /tmp/chrome.log 2>&1 &

# noVNC 웹 서버 시작
websockify \
    --web=/usr/share/novnc \
    6080 \
    localhost:5901 &