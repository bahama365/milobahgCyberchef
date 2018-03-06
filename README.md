# Docker GCHQ CyberChef application

CyberChef is a multi-purpose analysis tool created by GCHQ. It is a web-based app for "encryption, encoding, compression and data analysis."

To run this image in the background, use the following command:

docker run -d --name cyberchef -p 8080:80 milobahg/cyberchef

Then, connect to http://localhost:8080 using your web browser.
