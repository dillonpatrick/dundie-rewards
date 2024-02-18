import re
import smtplib
from email.mime.text import MIMEText

from dundie.settings import SMTP_HOST, SMTP_PORT, SMTP_TIMEOUT
from dundie.utils.log import get_logger

log = get_logger()

regex = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"


def check_valid_email(adress):
    """Return True if email is valid."""
    return bool(re.fullmatch(regex, adress))


def send_email(from_, to, subject, text):
    if not isinstance(to, list):
        to = [to]

    try:
        with smtplib.SMTP(
            host=SMTP_HOST, port=SMTP_PORT, timeout=SMTP_TIMEOUT
        ) as server:
            message = MIMEText(text)
            message["Subject"] = subject
            message["From"] = from_
            message["To"] = ",".join(to)
            server.sendmail(from_, to, message.as_string())
    except Exception:
        log.error("Cannot send e-mail to %s", to)
