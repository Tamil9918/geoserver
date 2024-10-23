# Use the official Tomcat base image
FROM tomcat:9.0

#Copy the GeoServer WAR file into the webapps directory of Tomcat
COPY geoserver.war /usr/local/tomcat/webapps/

# Copy your custom web.xml to the appropriate location
#COPY web.xml /usr/local/tomcat/webapps/geoserver/WEB-INF/web.xml

# Create the data directory
RUN mkdir -p /usr/local/tomcat/data

# Set the data directory path to listen to your local data directory
# Adjust the paths as needed
VOLUME /usr/local/tomcat/data

ENV JAVA_OPTS="-DGEOSERVER_DATA_DIR=/usr/local/tomcat/data"


# Optional: Expose port 8080
EXPOSE 8080
