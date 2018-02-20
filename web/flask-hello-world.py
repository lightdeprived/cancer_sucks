from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return """
    <HTML>
        <Body>Hello, World!</Body>
    </HTML>"""

@app.route("/test")
def test():
    return "Test!"

if __name__ == "__main__":
    app.run()