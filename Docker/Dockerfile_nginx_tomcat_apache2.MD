1. Dockerfile for "NGINX" web server
    ```sh
    FROM ubuntu
    RUN apt-get update
    RUN apt-get install nginx -y
    COPY index.html /var/www/html/
    EXPOSE 80
    CMD ["nginx","-g","daemon off;"]
    ```
    
2. Dockerfile for "tomcat" web server
    ```sh
    FROM 
    ```
    
3. Dockerfile for "apache2-httpd" web server
    ```sh
    FROM 
    ```
