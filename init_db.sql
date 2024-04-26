CREATE TABLE IF NOT EXISTS worker
(
    id         BIGSERIAL PRIMARY KEY,
    name       VARCHAR(1000) NOT NULL ,
    birthday   DATE,
    level      VARCHAR(7) NOT NULL,
	salary     INT CHECK (salary>=100 and salary<=100000),
	CONSTRAINT chk_birthday CHECK (birthday > '1900-01-01'),
	CONSTRAINT chk_level CHECK (level IN ('Trainee', 'Junior', 'Middle', 'Senior'))
);

CREATE TABLE IF NOT EXISTS client
(
    id         BIGSERIAL PRIMARY KEY,
    name       VARCHAR(1000) NOT NULL
);

CREATE TABLE IF NOT EXISTS progect
(
    id         BIGSERIAL PRIMARY KEY,
    client_id  BIGINT,
    start_date   DATE,
    finish_date   DATE,
	FOREIGN KEY (client_id) REFERENCES client (id),
    name VARCHAR(1000)
);

CREATE TABLE IF NOT EXISTS progect_worker
(
    progect_id  BIGINT,
	worker_id   BIGINT,
	PRIMARY KEY (progect_id, worker_id),
	FOREIGN KEY (progect_id) REFERENCES progect (id),
	FOREIGN KEY (worker_id) REFERENCES worker (id)
);
