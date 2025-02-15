FROM httpd 

MAINTAINER siva samana 

LABEL This is my first dockerifle integrate with jenkins

EXPOSE 80

COPY . /usr/local/apache2/htdocs


