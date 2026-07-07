# shnotifyme

Bash script that authenticates on your Google account via app password and sends yourself an e-mail when a bash scripts finishes running. Has built-in waiting to start until a set amount of memory is available

## How to run
First, [set up an Google app password](myaccount.google.com/apppasswords), it will give you an 16 digit password.

Edit the `credentials.sh` file with your Gmail address and the app password generated above

The script is meant to be run relative to another project in this file configuration:
 - `project/`
    - `your_script.sh`
 - `shnotifyme/`
    - `notify.sh`

To run:
```
bash shnotifyme/notify.sh project/your_script.sh
```
with `your_script.sh` being the script that you want to be notified about when execution ends

## Waiting until there's enough memory

You can wait until there's a set amount of memory to run `your_script.sh` by using the included `wait.sh` script
```
bash shnotifyme/wait.sh your_script.sh
```
The default memory to wait for is 18000 (MiB), you can set this by changing the `required` parameter in `wait.sh`. It waits for 30 seconds when it gets enough memory as to not race with other possible upcoming proccesses

## Combining `notify.sh` and `wait.sh`
You can combine the functionality of notifying and waiting for memory by running:
```
bash shnotifyme/notify.sh shnotifyme/wait.sh project/your_script.sh
```
Or by using the included `wait_notify.sh` script that does exactly the same
```
bash shnotifyme/wait_notify.sh project/your_script.sh
```


## Testing if it works
You can test if everything is set by running the test script while in a parent dir:

### Test only notification:
```
bash shnotifyme/notify.sh shnotifyme/scripts/test.sh
```
### Test only waiting for memory:
```
bash shnotifyme/wait.sh shnotifyme/scripts/test.sh
```
### Test both:
```
bash shnotifyme/wait_notify.sh shnotifyme/scripts/test.sh
```


You can be even more sure if it works by setting up the same file layout in [How to run](#how-to-run) and testing with your external project

The expected incoming e-mail is something like
```
O script terminou de executar e reporta os seguintes dados:
Script executado:  scripts/test.sh
Status:  Success
Tempo decorrido: 00:00:05
```
do take note that time spent waiting for enough memory also counts towards run time

## File structure
 - `scripts/`
   - `test.py` and `test.sh` - dummy test scripts used throughout this readme
   - `pynotify.py` - handles mail-sending
 - `credentials.sh` - where to place your gmail credentials (see [How to run](#how-to-run))
 - `notify.sh` - orchestrates `pynotify.py`
 - `wait.sh` - waits until there's the set memory to run the command
 - `wait_notify.sh` - combines both scripts above