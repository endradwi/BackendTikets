package models

import (
	"context"
	"fmt"
	"log"
	"test/lib"
	"time"

	"github.com/jackc/pgx/v5"
)

type order struct {
	Id          int
	Profile_id  int      `json:"profile_id" form:"profile_id" db:"profile_id"`
	Movie_id    int      `json:"movie_id" form:"movie_id" db:"movie_id"`
	Cinema_id   int      `json:"cinema_id" form:"cinema_id" db:"cinema_id"`
	Seat        []string `json:"seat" form:"seat[]"`
	Quantity    int      `json:"quantity" form:"quantity" db:"quantity"`
	TotalPrice  int      `json:"total_price" form:"total_price" db:"total_price"`
	Cinema_name string   `json:"cinema_name" form:"cinema_name" db:"cinema_name"`
	Location    string   `json:"location" form:"location" db:"location"`
}

type OrderBody struct {
	order
	Date string `json:"date" form:"date" `
	Time string `json:"time" form:"time" `
}

type OrderData struct {
	order
	Date time.Time `db:"date"`
	Time time.Time `db:"time"`
}

type Orders struct {
	Id         int    `json:"id"`
	Profile_Id int    `json:"profile_id" form:"profile_id"`
	Movie_Id   int    `json:"movie_id" form:"movie_id"`
	Tittle     string `json:"tittle" form:"tittle"`
	Genre      string `json:"genre" form:"genre"`
	Images     string `json:"image" form:"image"`
	Qty        int    `json:"qty" form:"qty"`
	Seat       string `json:"seat" form:"seat"`
	Cinema     string `json:"cinema" form:"cinema"`
	TotalPrice int    `json:"total_price" form:"total_price"`
}

type MoviesCinema struct {
	Id              int    `json:"id"`
	Tittle          string `json:"tittle" form:"tittle"`
	Genre           string `json:"genre" form:"genre"`
	Images          string `json:"image" form:"image"`
	Cinema          string `json:"cinema" form:"cinema"`
	Cinema_date     string `json:"cinema_date" form:"cinema_date"`
	Cinema_time     string `json:"cinema_time" form:"cinema_time"`
	Cinema_location string `json:"cinema_location" form:"cinema_location"`
}

type seat string

type SeatCinema struct {
	Id              int    `json:"id"`
	Tittle          string `json:"tittle" form:"tittle"`
	Genre           string `json:"genre" form:"genre"`
	Images          string `json:"image" form:"image"`
	Cinema          string `json:"cinema" form:"cinema"`
	Cinema_date     string `json:"cinema_date" form:"cinema_date"`
	Cinema_time     string `json:"cinema_time" form:"cinema_time"`
	Cinema_location string `json:"cinema_location" form:"cinema_location"`
	Price           int    `json:"price" from:"price"`
	Seats           []seat `json:"seat" from:"seat[]"`
}

type TotalSeatCinema struct {
	SeatCinema
	Total_Seat int
}

type ListCinema []MoviesCinema

type ListOrders []Orders

func OrderTicket(data OrderBody) OrderData {
	conn := lib.DB()
	defer conn.Close(context.Background())

	var order OrderData
	cinema := struct {
		price int `db:"price"`
	}{}

	conn.QueryRow(context.Background(),
		`SELECT price FROM cinema WHERE id = $1`, data.Cinema_id).Scan(&cinema.price)

	totalPrice := cinema.price * len(data.Seat) * data.Quantity

	conn.QueryRow(context.Background(), `
	SELECT cinema.name, cinema_location.name_location
	FROM cinema
	JOIN cinema_location ON cinema_location.cinema_id = cinema.id
	WHERE cinema.id = $1`,
		data.Cinema_id).Scan(&order.Cinema_name, &order.Location)

	conn.QueryRow(context.Background(), `
	INSERT INTO orders (profile_id, movie_id, cinema_id, seat, date_order, qty, total_price) 
	VALUES ($1, $2, $3, $4, $5, $6, $7) 
	RETURNING id, profile_id, movie_id, cinema_id, seat, date_order, qty, total_price`,
		data.Profile_id, data.Movie_id, data.Cinema_id, data.Seat, data.Date, data.Quantity, totalPrice).Scan(
		&order.Id, &order.Profile_id, &order.Movie_id, &order.Cinema_id, &order.Seat, &order.Date, &order.Quantity, &order.TotalPrice,
	)

	return order
}

func BookingCinema(paramId int, searchTime string, searchDate string, searchLocation string) ListCinema {
	conn := lib.DB()
	defer conn.Close(context.Background())
	// var movie ListCinema

	// searchingTime := fmt.Sprintf("%%%s%%", searchTime)
	// searchingDate := fmt.Sprintf("%%%s%%", searchDate)
	searchingLocation := fmt.Sprintf("%%%s%%", searchLocation)

	rows, err := conn.Query(context.Background(), `
	SELECT movies.id, movies.tittle, movies.genre,
	movies.images, cinema.name, cinema_time.name_time,
	cinema_date.name_date, cinema_location.name_location
	FROM cinema 
    JOIN movies ON cinema.movies_id = movies.id
	JOIN cinema_time ON cinema_time.cinema_id = cinema.id
	JOIN cinema_date ON cinema_date.cinema_id = cinema.id
	JOIN cinema_location ON cinema_location.cinema_id = cinema.id
    WHERE movies.id = $1 AND cinema_time.name_time = $2
	AND cinema_date.name_date = $3 AND cinema_location.name_location ILIKE $4
	`, paramId, searchTime, searchDate, searchingLocation)
	log.Println("data rows =", rows)
	if err != nil {
		log.Println("data error=", err)
	}

	cinema, err := pgx.CollectRows(rows, pgx.RowToStructByName[MoviesCinema])
	if err != nil {
		log.Println("data error=", err)
	}
	log.Println("data cinema =", cinema)
	return cinema
}
