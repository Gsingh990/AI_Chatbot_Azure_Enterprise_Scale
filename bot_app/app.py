from flask import Flask, request, jsonify
import os

app = Flask(__name__)

@app.route('/api/messages', methods=['POST'])
def messages():
    # This is a very basic echo bot. In a real bot, you would parse the incoming
    # Bot Framework activity, process it, and send a response.
    # For now, we'll just echo back the received message.
    try:
        activity = request.get_json()
        if activity and 'text' in activity:
            response_text = f"You said: {activity['text']}"
            # In a real bot, you'd construct a proper Bot Framework response activity
            # For this simple echo, we'll just return text.
            return jsonify({
                'type': 'message',
                'text': response_text
            })
        return jsonify({'status': 'no text'}), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/', methods=['GET'])
def index():
    return "Hello from the IaC-GPT Chatbot App!"

if __name__ == '__main__':
    # Use PORT environment variable provided by App Service
    port = int(os.environ.get('PORT', 8000))
    app.run(host='0.0.0.0', port=port)
