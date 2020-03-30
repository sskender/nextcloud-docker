FROM instrumentisto/coturn:latest

COPY turnserver.conf /etc/coturn/turnserver.conf

# update auth secret
RUN sed -i "s/north/$(openssl rand -hex 32)/" /etc/coturn/turnserver.conf
RUN newsecret=$(grep "static-auth-secret" /etc/coturn/turnserver.conf)
RUN echo "NEW SECRET: $newsecret"

# update cli password
#RUN sed -i "s/cli-password=CHANGE_ME/cli-password=$(openssl rand -hex 32)/" /etc/coturn/turnserver.conf
#RUN newpassword=$(grep "cli-password" /etc/coturn/turnserver.conf)
#RUN echo "NEW CLI PASSWORD: $newpassword"
