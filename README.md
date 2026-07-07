# notifyme

Bash script that authenticates on your Google account via app password and sends yourself an e-mail when a bash scripts finishes running

## How to run
First, [set up an Google app password](myaccount.google.com/apppasswords), it will give you an 16 digit password.

Edit the `credentials.sh` file with your Gmail address and the app password generated above

To run:
```
bash notify.sh your_script.sh
```
with `your_script.sh` being the script that you want to be notified about when execution ends

## Testing if it works
You can test if everything is set by runnig the test script:
```
bash notify.sh scripts/test.sh
```

The expected incoming e-mail is
```
O script terminou de executar e reporta os seguintes dados:
Script executado:  test.sh
Status:  Success
Tempo decorrido: 00:00:05
```

## File structure
If anything needs changing, `scripts/pynotify.py` handles mail-sending and `notify.sh` handles running it