#!/usr/bin/env python

from fastapi import FastAPI, Depends,Response
import uvicorn
import db
import os

app = FastAPI()

@app.post("/<f>/<l>/<a>/<t>")
def _put(f, l, a, t):
    try:
        db.writing(f, l, a, t)
        message = f"/{f}/{l}/{a}/{t} has been created"
    except Exception as e:
        message = str(e)
    return Response(dict(message=message))


@app.get("/<f>")
async def _get(f):
    results = []
    try:
        results = db.reading(f, False)
        message = "got results"
    except Exception as e:
        message = str(e)
    return Response(dict(message=message, results=results))

@app.get("/")
def _check():
    return "ok\n"

if __name__ == '__main__':
    port = os.environ.get("PORT", "8080")
    options = {
            'port': int(port),
            'host': '0.0.0.0',
            'workers': 2,
            'reload': True,
        }
    uvicorn.run("main:app", **options)
