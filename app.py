from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello, World!"
#hgggh
if __name__ == 'main':
    app.run(host='0.0.0.0', port=5000)
