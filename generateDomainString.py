import sys
domains = sys.argv[1].split(',')
certbotString = ""
for domain in domains:
    certbotString = certbotString + " -d " + domain
print(certbotString)
