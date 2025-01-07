CREATE TABLE seat (
    id serial PRIMARY KEY,
    name varchar(3),
    price INT,
    cinema_id INT REFERENCES cinema(id),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP
);

INSERT INTO seat (name, price, cinema_id) VALUES
('A1', 15000, 1),('A2', 15000, 1),('A3', 15000, 1),('A4', 15000, 1),('A5', 15000, 1),
('A6', 15000, 1),('A7', 15000, 1),('A8', 15000, 1),('A9', 15000, 1),('A10', 15000, 1),
('A11', 15000, 1),('A12', 15000, 1),('A13', 15000, 1),('A14', 15000, 1),('B1', 15000, 1),
('B2', 15000, 1),('B3', 15000, 1),('B4', 15000, 1),('B5', 15000, 1),('B6', 15000, 1),
('B7', 15000, 1),('B8', 15000, 1),('B9', 15000, 1),('B10', 15000, 1),('B11', 15000, 1),
('B12', 15000, 1),('B13', 15000, 1),('B14', 15000, 1),('C1', 15000, 1),('C2', 15000, 1),
('C3', 15000, 1),('C4', 15000, 1),('C5', 15000, 1),('C6', 15000, 1),('C7', 15000, 1),
('C8', 15000, 1),('C9', 15000, 1),('C10', 15000, 1),('C11', 15000, 1),('C12', 15000, 1),
('C13', 15000, 1),('C14', 15000, 1),('D1', 15000, 1),('D2', 15000, 1),('D3', 15000, 1),
('D4', 15000, 1),('D5', 15000, 1),('D6', 15000, 1),('D7', 15000, 1),('D8', 15000, 1),
('D9', 15000, 1),('D10', 15000, 1),('D11', 15000, 1),('D12', 15000, 1),('D13', 15000, 1),
('D14', 15000, 1),('E1', 15000, 1),('E2', 15000, 1),('E3', 15000, 1),('E4', 15000, 1),
('E5', 15000, 1),('E6', 15000, 1),('E7', 15000, 1),('E8', 15000, 1),('E9', 15000, 1),
('E10', 15000, 1),('E11', 15000, 1),('E12', 15000, 1),('E13', 15000, 1),('E14', 15000, 1),
('F1', 15000, 1),('F2', 15000, 1),('F3', 15000, 1),('F4', 15000, 1),('F5', 15000, 1),
('F6', 15000, 1),('F7', 15000, 1),('F8', 15000, 1),('F9', 15000, 1),('F10', 15000, 1),
('F11', 15000, 1),('F12', 15000, 1),('F13', 15000, 1),('F14', 15000, 1),('G1', 15000, 1),
('G2', 15000, 1),('G3', 15000, 1),('G4', 15000, 1),('G5', 15000, 1),('G6', 15000, 1),
('G7', 15000, 1),('G8', 15000, 1),('G9', 15000, 1),('G10', 15000, 1),('G10', 15000, 1),
('G11', 15000, 1),('G12', 15000, 1),('G13', 15000, 1),('G14', 15000, 1);