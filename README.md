# StockWise - Inventory & Sales Management System

Flask + SQLite + SQLAlchemy + Chart.js portfolio project.

## Quick start (Windows)
1. Install Python 3.10+ from python.org (tick "Add python.exe to PATH").
2. Double-click `START_STOCKWISE.bat`.
3. The browser opens at http://127.0.0.1:5000 - click "Create an account", register, log in.

## Manual start
```
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
flask --app run init-db
flask --app run seed-db      (adds clearly-marked SAMPLE data)
flask --app run run --debug
```
Run tests: `pytest`. Wipe everything: `flask --app run reset-db`.

## Status
Phase 1 complete: models for all tables, authentication (hashed passwords, CSRF, sessions),
protected routes, live dashboard, sample data, tests.
Next phases: products/categories, inventory, suppliers, sales/receipts, reports, docs.

## Known limitations
No login rate limiting; single permission level; dashboard sums money in Python (fine for small shops);
Chart.js loads from a CDN so the chart needs internet.
