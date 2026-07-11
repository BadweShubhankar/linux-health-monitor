# Linux Health Monitoring & Auto-Remediation System

## Overview

The **Linux Health Monitoring & Auto-Remediation System** is a Bash-based automation project that continuously monitors the health of a Linux server. It checks CPU, RAM, disk usage, and the status of critical services such as Nginx. If a monitored service stops unexpectedly, the system automatically attempts to restart it, logs the incident, and generates a Root Cause Analysis (RCA) report if recovery fails.

This project demonstrates practical Linux administration, automation, monitoring, troubleshooting, and reliability engineering concepts commonly used by Site Reliability Engineers (SREs).

-------------------------------------------------------------------------------------------------------------------------------------------

## Objectives

->Monitor system health automatically.
->Detect service failures.
->Perform automatic service recovery.
->Maintain centralized logs.
->Generate incident reports.
->Schedule continuous monitoring using Cron.

-------------------------------------------------------------------------------------------------------------------------------------------

## Features

-> CPU Usage Monitoring
-> RAM Usage Monitoring
-> Disk Usage Monitoring
-> Nginx Service Health Monitoring
-> Automatic Service Restart
-> Centralized Logging
-> Root Cause Analysis (RCA) Generation
-> Automated Monitoring using Cron
-> Modular Bash Script Architecture

-------------------------------------------------------------------------------------------------------------------------------------------

## Technologies Used

->Ubuntu Linux
->Bash Scripting
->systemd (`systemctl`)
->Cron (`crontab`)
->Nginx
->Linux System Utilities (`top`, `free`, `df`)
->Git & GitHub

-------------------------------------------------------------------------------------------------------------------------------------------

## Project Structure

text
linux-health-monitor/
│
├── config/
│   └── config.conf
│
├── logs/
│   └── monitor.log
│
├── rca/
│
├── scripts/
│   ├── monitor.sh
│   ├── logger.sh
│   ├── check_cpu.sh
│   ├── check_ram.sh
│   ├── check_disk.sh
│   ├── check_service.sh
│   ├── restart_service.sh
│   └── generate_rca.sh
│
├── screenshots/
│
├── README.md
└── .gitignore


------------------------------------------------------------------------------------------------------------------------------------------- 
## Workflow

text
Start Monitoring
        │
        ▼
Check CPU Usage
        │
        ▼
Check RAM Usage
        │
        ▼
Check Disk Usage
        │
        ▼
Check Nginx Service
        │
   ┌────┴────┐
   │         │
Running   Stopped
   │         │
   ▼              ▼
 Log OK   Restart Service
               │
        ┌──────┴──────┐
        │             │
    Success       Failed
        │             │
        ▼                  ▼
   Log Recovery   Generate RCA


-------------------------------------------------------------------------------------------------------------------------------------------

## Installation

Clone the repository:

bash
git clone <repository-url>

Navigate to the project directory:

bash
cd linux-health-monitor


Make all scripts executable:

bash
chmod +x scripts/*.sh


Install required packages:

```bash
sudo apt update
sudo apt install nginx cron
```

---

## Running the Project

Run the monitoring system manually:

bash
./scripts/monitor.sh


Check monitoring logs:

bash
cat logs/monitor.log

View generated incident reports:

bash
ls rca/


-------------------------------------------------------------------------------------------------------------------------------------------

## Cron Automation

Edit the user's crontab:

bash
crontab -e


Add the following entry to execute the monitoring script every minute:

cron
* * * * * /home/<username>/linux-health-monitor/scripts/monitor.sh


Verify:

bash
crontab -l


-------------------------------------------------------------------------------------------------------------------------------------------

## 📊 Sample Log

text
2026-07-10 22:30:01 [INFO] Health Check Started
2026-07-10 22:30:01 [INFO] CPU Usage Normal: 18%
2026-07-10 22:30:01 [INFO] RAM Usage Normal: 42%
2026-07-10 22:30:01 [INFO] Disk Usage Normal: 37%
2026-07-10 22:30:02 [INFO] nginx service is running.
2026-07-10 22:30:02 [INFO] Health Check Completed


-------------------------------------------------------------------------------------------------------------------------------------------

## Sample RCA Report

text
Incident ID : INC-1752189000

Timestamp   : Fri Jul 10 22:35:10 IST 2026

Hostname    : server01

Service     : nginx

Problem
-------
Service was found inactive.

Action Taken
------------
Automatic restart attempted.

Final Status
------------
FAILED


-------------------------------------------------------------------------------------------------------------------------------------------

## Skills Demonstrated

->Linux Administration
->Bash Scripting
->Process Monitoring
->Service Management
->Automation
->System Monitoring
->Cron Scheduling
->Log Management
->Troubleshooting
->Root Cause Analysis
->Git & GitHub

-------------------------------------------------------------------------------------------------------------------------------------------

## Future Enhancements

->Email notifications for critical alerts
->Multi-service monitoring
->Log rotation
->Configuration validation
->Slack/Discord alert integration
->Dashboard for health visualization
->Multi-server monitoring

-------------------------------------------------------------------------------------------------------------------------------------------

## Screenshots

Add screenshots of:

->Project folder structure
->Running monitor script
->Monitoring log
->Nginx service status
->Cron configuration
->Generated RCA report

-------------------------------------------------------------------------------------------------------------------------------------------

## License

This project is created for educational and learning purposes.

