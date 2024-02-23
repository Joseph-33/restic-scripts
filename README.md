# Restic Scripts

## 1. Installing Restic

Download restic from: https://github.com/restic/restic or via `sudo apt update` and `sudo apt install restic`
By default, ubuntu uses an old version, but an up-to-date version is needed to run the scripts.

Run `restic version` and ensure you are on the correct version (at least 0.16.4), if not try running `restic self-update`

## 2. Downloading the scripts

Download this repository via git clone:

`git clone https://github.com/Joseph-33/restic-scripts/`


## 3. Changing the file parameters

Note these three lines in the `restic_env.sh` file:
- RESTIC_REST_USERNAME - This should be your first name capitalised, we have created users for everyone in the group
- RESTIC_REST_PASSWORD - This is your server username password, we will give you this password.
- RESTIC_CACERT - This is the security certificate, you need it to connect to the server, ask me or Danish and we will give it to you via usb, remove the path and add your own.
- RESTIC_PASSWORD - Your personal password, 

## 4. Connecting to the Backup machine
Once you have set up everything, sourcing your file with `source restic_env.sh` so that you can talk to the server

Now try running `restic init`, it should ask for your personal password and work!

(If this hasn't worked, double and triple check everything in #3)

## 5. Backing up to the Backup machine

Try a test backup with 
```restic backup ~/folder/myfile```
If it worked, see if you can see your backup with `restic snapshots`.

## 6. Using the scripts

I have customised the scripts for myself, you will need to change the parameters in the `restic_backup.sh`.
The restic files have an rsync command which can be used for the cluster, remove this if you are not using it, also change the RESTIC_INCLUDE_PATHS.

## 7. Using Cron and Crontab

If everything seems to be working smoothly, you can now try setting up crontab:

`sudo apt update` && `sudo apt install cron`

Now enable it with `sudo systemctl enable cron`

`crontab` is a Unix utility for scheduling commands to be executed periodically. This guide provides a brief overview of its usage.

## Basic Commands

- To view scheduled jobs: `crontab -l`
- To edit the crontab: `crontab -e`

## Syntax

An example is to run a command everyday at 13:00 everyday with a log file going to my-logs

```0 13 * * *  /path_to_restic/restic_backup.sh >> my_logs
- - - - -
| | | | |
| | | | +----- Day of week (0-7, Sunday=0 or 7)
| | | +------- Month (1-12)
| | +--------- Day of month (1-31)
| +----------- Hour (0-23)
+------------- Minute (0-59)
```

Remember to use full paths!! Not `restic`, but `/usr/pathtomyfile/bin/restic`

Test the crontab command, it may take some time setting up, but then everything will be automated.


## Cron vs Crontab vs Anacronda?
**Cron:**
- Cron is a time-based job scheduler in Unix-like operating systems.
- It allows users to schedule tasks (commands or scripts) to run periodically at fixed times, dates, or intervals.

**Crontab:**
- Crontab (cron table) is a configuration file used by the cron daemon to specify the schedule of cron jobs.
- Users can create, edit, and delete cron jobs using the crontab command.
- Each user has their own crontab file, typically located at `/etc/crontab` or `/var/spool/cron/crontabs/username`.

**Anacron:**
- Anacron is a cron-like utility that runs jobs periodically on a system.
- Unlike cron, which schedules jobs based on specific times, Anacron is designed to execute tasks at intervals, regardless of the system's uptime or shutdown state.
- It's useful for executing tasks that should run periodically, such as maintenance scripts, even if the system is not continuously powered on.


## Examples:
I use this crontab command:
`00 13 * * * /bin/bash /home/joseph/Documents/Backup/Restic/restic-scripts/restic_backup.sh >> /home/joseph/Documents/Backup/Restic/restic-scripts/logs/backup_log_$(date -I).log`

## I have a problem!
- Carefully read this tutorial
- Check the restic docs, here https://restic.readthedocs.io/en/stable/
- Are you trying to back up moving data?
- If nothing helps, talk to us
