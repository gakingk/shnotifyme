import argparse
import os
import smtplib
from email.message import EmailMessage

EMAIL = os.environ["EMAIL_ADDRESS"]
APP_PASSWORD = os.environ["EMAIL_PASSWORD"]

parser = argparse.ArgumentParser()
parser.add_argument("--script", required=True)
parser.add_argument("--status", type=int, required=True)
parser.add_argument("--elapsed", required=True)

args = parser.parse_args()

status = "Success" if args.status == 0 else f"Failed (exit code {args.status})"

msg = EmailMessage()
msg["Subject"] = f"{status} - {args.script}"
msg["From"] = EMAIL
msg["To"] = EMAIL

msg.set_content(f"""\
O script terminou de executar e reporta os seguintes dados:
Script executado:  {args.script}
Status:  {status}
Tempo decorrido: {args.elapsed}
""")

with smtplib.SMTP_SSL("smtp.gmail.com", 465) as smtp:
    smtp.login(EMAIL, APP_PASSWORD)
    smtp.send_message(msg)

print(f"Notificação enviada para {EMAIL}")
