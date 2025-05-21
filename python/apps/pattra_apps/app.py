from flask import Flask , jsonify , request, render_template , url_for
import requests
import psycopg2
import psycopg2.extras
from flask_cors import CORS

application = Flask(__name__)
CORS(application)

def get_db_connection():
    conn = psycopg2.connect(
        dbname='kneks',
        user='postgres',
        password='123',
        host='localhost',
        port='5432'
    )
    return conn

@application.route('/')
def index():
    return jsonify([
        {"id": "1", "name": "rifqi", "preferences": "asdasd"},
        {"id": "1", "name": "rifqi", "preferences": "asdasd"},
        {"id": "1", "name": "rifqi", "preferences": "asdasd"}
    ])


@application.route('/users')
def users():
    conn = get_db_connection()
    cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
    cur.execute('SELECT * FROM users')
    users = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify(users)    


@application.route('/list', methods=['GET'])
def lists():
    api_url = 'https://jsonplaceholder.typicode.com/todos'
    try:
        response = requests.get(api_url)
        response.raise_for_status()  
        data = response.json()
        if isinstance(data, list):
            return render_template('bacajson.html', rows=data)
        else :
            return jsonify(data)

    except requests.exceptions.RequestException as e:
        return jsonify({'error': str(e)}), 500

@application.route('/kirimjson', methods=['POST'])
def receive_data():
    data = request.get_json()
    print('Received:', data)
    return jsonify({"message": "Data received", "your_data": data})

@application.route('/home', methods=['GET'])
def home():
    array_data = ['rifqi','ahsan','zakri','zikra','yani']
    return render_template('home.html', rows=array_data)

@application.route('/media', methods=['GET'])
def media():
    return render_template('media.html')

@application.route('/logic', methods=['GET'])
def logic():
    return render_template('logic.html')


if __name__ == '__main__':
    application.run(debug=True)