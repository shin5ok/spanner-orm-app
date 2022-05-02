#!/usr/bin/env python

from flask import Flask, jsonify
import db
import os

app = Flask(__name__)

@app.route("/<f>/<l>/<a>/<t>", methods=["POST"])
def _put(f, l, a, t):
    try:
        db.writing(f, l, a, t)
        message = f"/{f}/{l}/{a}/{t} has been created"
    except Exception as e:
        message = str(e)
    return jsonify(dict(message=message))


@app.route("/<f>", methods=["GET"])
def _get(f):
    results = []
    try:
        results = db.reading(f, False)
        message = "got results"
    except Exception as e:
        message = str(e)
    return jsonify(dict(message=message, results=results))

@app.route("/")
def _check():
    return "ok\n"

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=int(os.environ.get("PORT", 8080)))
