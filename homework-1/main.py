"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2
import csv
# Соеденяемся з базой данных
with psycopg2.connect(
    host="localhost",
    database="north",
    user="postgres",
    password="325896325896"
) as conn:
    # Используем метод cursor() для выполнения запросов
    with conn.cursor() as cur:
        # Открываем CSV-файл customers_data.csv
        with open('north_data/customers_data.csv', 'r') as f:
            # Создаём объект reader, указываем, что разделителем является запятая
            reader = csv.reader(f, delimiter=',')
            # Пропускаем заголовок
            next(reader)

            # Запрос для вставки данных
            insert_query = ('INSERT INTO customers_data (customer_id, company_name, contact_name) '
                            'VALUES (%s, %s, %s)')

            # Вставляем данные из CSV-файла в таблицу PostgreSQL
            for row in reader:
                cur.execute(insert_query, row)

        # Открываем CSV-файл employees_data.csv
        with open('north_data/employees_data.csv', 'r') as f:
            reader = csv.reader(f, delimiter=',')
            next(reader)

            insert_query = ('INSERT INTO employees_data (employee_id, first_name, last_name, title, birth_date, notes) '
                            'VALUES (%s, %s, %s, %s, %s, %s)')

            for row in reader:
                cur.execute(insert_query, row)

        # Открываем CSV-файл orders_data.csv
        with open('north_data/orders_data.csv', 'r') as f:
            reader = csv.reader(f, delimiter=',')
            next(reader)

            insert_query = ('INSERT INTO orders_data (order_id, customer_id, employee_id, order_date, ship_city) '
                            'VALUES (%s, %s, %s, %s, %s)')

            for row in reader:
                cur.execute(insert_query, row)

        cur.execute("SELECT * FROM orders_data")

        rows = cur.fetchall()
        for row in rows:
            print(row)

conn.close()  # Закрываем соединение



