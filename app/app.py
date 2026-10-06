from flask import Flask, jsonify
import os
import socket

app = Flask(__name__)

@app.get("/")
def index():
    return jsonify(service="cloud-k8s-demo", status="running")

@app.get("/health")
def health():
    return jsonify(status="healthy", service="cloud-k8s-demo")

@app.get("/info")
def info():
    return jsonify(
        hostname=socket.gethostname(),
        version=os.getenv("APP_VERSION", "1.0.0"),
        environment=os.getenv("APP_ENV", "local")
    )

@app.get("/metrics")
def metrics():
    return "demo_requests_total 1\n", 200, {"Content-Type": "text/plain; version=0.0.4"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
