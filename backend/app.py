from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

products = [
    {"id":1,"name":"Laptop"},
    {"id":2,"name":"Mobile"},
    {"id":3,"name":"Tablet"}
]

@app.route("/products")
def get_products():
    return jsonify(products)

if __name__ == "__main__":
    app.run(host="0.0.0.0",port=5000)
