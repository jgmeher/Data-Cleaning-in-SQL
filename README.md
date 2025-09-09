# SQL Data Cleaning – World Life Expectancy Dataset

This repository contains SQL queries used to clean and preprocess the **World Life Expectancy** dataset.

## What’s Inside
- Remove duplicates based on `(country, year)`
- Fix missing values in `status` (Developed vs Developing)
- Fill missing `Life expectancy` using interpolation
- Validate data against a backup table

## Usage
Run the queries in order from `cleaning_world_life_expectancy.sql` on your database.

## Tools
- MySQL 8.0 (tested)
- Works with other RDBMS with minor syntax changes

## Author
Gnanesh Meher Jakkam  
[LinkedIn](https://www.linkedin.com/in/gnaneshmeherjakkam/) | [Email](mailto:gnaneshmeherjakkam@gmail.com)
