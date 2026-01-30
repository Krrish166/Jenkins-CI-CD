from flask import Flask, jsonify
from config import Config

app = Flask(__name__)
app.config.from_object(Config)

@app.route("/")
def home():
    return jsonify({
        "message": "Hello from Python Flask App 🚀",
        "env": app.config["ENV_NAME"]
    })

@app.route("/health")
def health():
    return jsonify({"status": "UP"}), 200

@app.route("/api/books")
def books():
    return jsonify([
        {"id": 1, "title": "Terraform Basics"},
        {"id": 2, "title": "AWS for DevOps"},
        {"id": 3, "title": "Python Automation"}
    ])

if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=8000,
        debug=True
    )
