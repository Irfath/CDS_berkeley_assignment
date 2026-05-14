from flask import Flask
from redis import Redis
import os

app = Flask(__name__)
# Redis connection details from environment variables for flexibility
redis_host = os.getenv('REDIS_HOST', 'localhost')
redis_port = os.getenv('REDIS_PORT', 6379)

redis = Redis(host=redis_host, port=redis_port)

@app.route('/')
def hello():
    # Increment the counter in Redis [cite: 24]
    count = redis.incr('hits')
    return f'<h1>Berkeley Project</h1><p>This is the {count} visitor.</p>'

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)