
hotel-management/
├── sql/
│   └── hotel_management_schema.sql
├── README.md

# Hotel Management SQL Schema

This repository contains the SQL schema for a hotel management system. It defines the structure for managing users, employees, rooms, reservations, and payments.

## Files
- `sql/hotel_management_schema.sql`: SQL script for database creation.

## Features
- User accounts with roles (Admin and Customer)
- Employee records
- Room information and availability
- Reservation tracking
- Payment management

## Usage
1. Clone this repository.
2. Run the `hotel_management_schema.sql` file in your MySQL or compatible database system:
   ```bash
   mysql -u [username] -p < sql/hotel_management_schema.sql
