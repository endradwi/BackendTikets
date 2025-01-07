package models

import (
	"context"
	"test/lib"
	"time"
)

type Payment struct {
	No_Rekening   int       `json:"no_rekening" form:"no_rekening"`
	Total_Payment int       `json:"total_payment" form:"total_payment"`
	Limit_Payment time.Time `json:"limit_payment" form:"limit_paymnet"`
}
type PaymentData struct {
	id             int
	Payment_Method int `json:"payment_method" form:"payment_method"`
}

func PaymentMethod(data PaymentData) Payment {
	conn := lib.DB()
	defer conn.Close(context.Background())

	var order Payment

	conn.QueryRow(context.Background(), `
	UPDATE orders
	SET payment_id = $1
	WHERE id = $2
	RETURNING id, profile_id, movie_id, cinema_id, payment_id, seat, date_order, qty, total_price`,
		data.Payment_Method, data.id).Scan(
		&order.No_Rekening, &order.Total_Payment, &order.Limit_Payment,
	)
	return order
}
