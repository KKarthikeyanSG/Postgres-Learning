
CREATE TABLE tr_vhe_tbl (
    vhe_id SERIAL PRIMARY KEY,
    vhe_num VARCHAR(20) NOT NULL,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL
);


CREATE TABLE status (
    status_id SERIAL PRIMARY KEY,
    status_desc VARCHAR(50) NOT NULL
);


CREATE TABLE driver (
    drv_id SERIAL PRIMARY KEY,
    drv_name VARCHAR(100) NOT NULL,
    drv_email VARCHAR(100),
    drv_phone VARCHAR(20)
);


CREATE TABLE tm_trac_tbl (
    jn_id SERIAL PRIMARY KEY,
    vhe_id INT NOT NULL,
    drv_id INT NOT NULL,
    start_loc VARCHAR(255) NOT NULL,
    end_loc VARCHAR(255) NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP,
    cur_loc VARCHAR(255),
    status_id INT NOT NULL,
    dist_tvl DECIMAL(10, 2),
    est_ariv TIMESTAMP,
    last_update_time TIMESTAMP NOT NULL,
    FOREIGN KEY (vhe_id) REFERENCES tr_vhe_tbl(vhe_id),
    FOREIGN KEY (drv_id) REFERENCES driver(drv_id),
    FOREIGN KEY (status_id) REFERENCES status(status_id)
);




INSERT INTO tr_vhe_tbl (vhe_num, make, model, year)
VALUES 
    ('ABC123', 'Toyota', 'Corolla', 2020),
    ('XYZ789', 'Ford', 'Focus', 2018);


INSERT INTO status (status_desc)
VALUES 
    ('In Progress'),
    ('Completed');


INSERT INTO driver (drv_name, drv_email, drv_phone)
VALUES 
    ('AAA', 'AAA@example.com', '123-456-7890'),
    ('BBB', 'BBB@example.com', '098-765-4321');


INSERT INTO tm_trac_tbl (vhe_id, drv_id, start_loc, end_loc, start_time, end_time, cur_loc, status_id, dist_tvl, est_ariv, last_update_time)
VALUES 
    (1, 1, 'City A', 'City B', '2024-07-04 08:00:00', '2024-07-04 12:00:00', 'City B', 2, 300.00, '2024-07-04 12:00:00', '2024-07-04 12:00:00'),
    (2, 2, 'City C', 'City D', '2024-07-04 09:00:00', NULL, 'City E', 1, 150.00, '2024-07-04 15:00:00', '2024-07-04 10:00:00');
