from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return """
    <html>
        <head>
            <title>My App</title>
        </head>
        <body style="font-family: Arial; background-color: white;">
            <h1>🚀 Deployment Successful</h1>
            <p>Deployed via GitHub Actions + Terraform</p>
        </body>
    </html>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
