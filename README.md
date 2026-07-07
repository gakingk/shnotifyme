# shnotifyme

Bash script that authenticates on your Google account via app password and sends yourself an e-mail when a bash scripts finishes running

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

## Testing if it works
You can test if everything is set by running the test script in the root of the project:
```
bash notify.sh scripts/test.sh
```
You can be even more sure if it works by setting up the same file layout in [How to run](#how-to-run) and testing with your project

The expected incoming e-mail is
```
O script terminou de executar e reporta os seguintes dados:
Script executado:  test.sh
Status:  Success
Tempo decorrido: 00:00:05
```



## File structure
If anything needs changing, `scripts/pynotify.py` handles mail-sending and `notify.sh` handles running it