from flask import Flask, render_template
import mysql.connector

app = Flask(__name__)

def get_db_connection():
    try:
        connection = mysql.connector.connect(
            host="kurswahl.lfs-ol.de",
            user="eventhub01user",
            password="OBPZDZxWJ-E_xKWo",
            database="eventhub01",
            connection_timeout=5
        )
        return connection
    except mysql.connector.Error as e:
        print("MYSQL FEHLER:", e)
        return None


@app.route("/test")
def test():
    return "Flask läuft"


@app.route("/")
def index():
    connection = get_db_connection()

    if connection is None:
        return "Datenbankverbindung fehlgeschlagen."

    cursor = connection.cursor(dictionary=True)

    cursor.execute("""
        SELECT
            id,
            title,
            description,
            event_date,
            event_time,
            location,
            price,
            total_tickets,
            sold_tickets,
            (total_tickets - sold_tickets) AS tickets_left
        FROM events
        ORDER BY event_date ASC
    """)

    events = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template("index.html", events=events)


if __name__ == "__main__":
    app.run(debug=True)