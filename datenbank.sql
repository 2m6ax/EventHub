USE eventhub01;


CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('user', 'admin') NOT NULL DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


CREATE TABLE events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    event_date DATE NOT NULL,
    event_time TIME NOT NULL,
    location VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    total_tickets INT NOT NULL,
    sold_tickets INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


CREATE TABLE tickets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    event_id INT NOT NULL,
    ticket_code VARCHAR(50) NOT NULL UNIQUE,
    purchased_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE
) ENGINE=InnoDB;



INSERT INTO events (
    title,
    description,
    event_date,
    event_time,
    location,
    price,
    total_tickets,
    sold_tickets
) VALUES
(
    'Theaterabend',
    'Aufführung der Theater-AG in der Aula.',
    '2026-03-05',
    '18:00:00',
    'Aula',
    4.00,
    90,
    81
),
(
    'Schulparty',
    'Party für die Oberstufe mit Musik und Getränken.',
    '2026-04-10',
    '20:00:00',
    'Oberstufenraum',
    6.00,
    120,
    96
),
(
    'Abschlussball',
    'Feierlicher Abschlussball des Jahrgangs.',
    '2026-06-19',
    '19:00:00',
    'Turnhalle',
    12.50,
    140,
    54
);