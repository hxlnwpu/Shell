import sys
import smtplib
from email.mime.text import MIMEText
from email.header import Header

#用于发送邮件： 格式：mail.py <emailaddress> msg1 msg2
to_addr=str(sys.argv[1])
content=str(sys.argv[2]+sys.argv[3])
msg=MIMEText(content,'plain','utf-8')

#发件人地址
from_addr ='*****'
password = '*****'

# 输入SMTP服务器地址:
smtp_server = 'smtp.****'
server = smtplib.SMTP(smtp_server, 25) # SMTP协议默认端口是25
server.set_debuglevel(1)
server.login(from_addr, password)
server.sendmail(from_addr, [to_addr], msg.as_string())
server.quit()