#!/bin/bash

install_backend() {
    cd backend
    pip install -r requirements.txt > /dev/null 2>&1
    cd ..
}

install_frontend() {
    cd frontend
    npm install > /dev/null 2>&1
    cd ..
}

start_backend() {
    cd backend
    python3 app.py &
    BACKEND_PID=$!
    cd ..
    sleep 2
}

start_frontend() {
    cd frontend
    npm run dev &
    FRONTEND_PID=$!
    cd ..
    sleep 3
}

cleanup() {
    kill $BACKEND_PID 2>/dev/null
    kill $FRONTEND_PID 2>/dev/null
    exit 0
}

trap cleanup SIGINT SIGTERM

if [ ! -d "frontend/node_modules" ]; then
    install_frontend
fi

if [ ! -d "backend/__pycache__" ]; then
    install_backend
fi

start_backend
start_frontend

echo "Servers started. Open http://localhost:5173"
echo "Press Ctrl+C to stop"

while true; do
    sleep 1
done