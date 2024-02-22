# Restic Scripts

List of scripts useful to perform automated backups with restic, designed to be used to backup to a REST server.

## Installing Restic

Download restic from: https://github.com/restic/restic or via `sudo apt update` and `sudo apt install restic`

Run `restic version` and ensure you are on the correct version (at least 0.16.4), if not try running `restic self-update`

## Downloading the scripts

Download this repository via git clone:

`git clone https://github.com/Joseph-33/restic-scripts/`


## Changing the file parameters

Note these three lines in the `restic_env.sh` file:
- RESTIC_REST_USERNAME - This should be your first name capitalised, we have created users for everyone in the group
- RESTIC_REST_PASSWORD - This is your server username password, we will give you this password.
- RESTIC_CACERT - This is the security certificate, you need it to connect to the server, ask me or Danish and we will give it to you via usb, remove the path and add your own.
- RESTIC_PASSWORD - Your personal password, 

## Connecting to the Backup machine
Once you have set up everything, sourcing your file with `source restic_env.sh` so that you can talk to the server

Now try running `restic init`, it should ask for your personal password and work!

(If this hasn't worked, double and triple check everything in #3)

## Backing up to the Backup machine

Try a test backup with 
```restic backup ~/folder/myfile```
If it worked, see if you can see your backup with `restic snapshots`.

## Using the scripts

I have customised the scripts for myself, you will need to change the parameters in the `restic_backup.sh`.
The restic files have an rsync command which can be used for the cluster, remove this if you are not using it, also change the RESTIC_INCLUDE_PATHS.

## Using Cron and Crontab

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
Cron is a system utility used for scheduling recurring tasks on Unix-like operating systems. It relies on the system clock to execute commands or scripts at specific times or intervals. crontab is the command-line interface for managing cron jobs. Users can create, edit, and delete scheduled tasks using crontab, specifying the timing and frequency of execution. On the other hand, anacron is a separate utility designed for running periodic tasks on systems that may not be continuously running, such as laptops or desktop computers. It adjusts task scheduling based on the system's uptime, ensuring that missed tasks are executed when the system is next powered on. Each of these utilities serves a distinct purpose in automating tasks on Unix-like systems, providing flexibility and control over when and how tasks are executed.


## Examples:
I use this crontab command:
`00 13 * * * /bin/bash /home/joseph/Documents/Backup/Restic/restic-scripts/restic_backup.sh >> /home/joseph/Documents/Backup/Restic/restic-scripts/logs/backup_log_$(date -I).log`

## I have a problem!
- Carefully read this tutorial
- Check the restic docs, here https://restic.readthedocs.io/en/stable/
- Are you trying to back up moving data?
- If nothing helps, talk to us
