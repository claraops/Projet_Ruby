#ulisiser l'image officile de ruby
FROM ruby:3.4

#installer des dependances suyteme 
RUN apt-get update -qq && apt-get install -y build-essential nodejs npm

#definir le repertoire de travial
WORKDIR /app

#copier les fichier GMEFILE
COPY app/Gemfile app/Gemfile.lock ./


RUN bundle install


COPY app ./


RUN chmod +x /app/entrypoint.sh


RUN npm install --global yarn


EXPOSE 3000

ENTRYPOINT [ "/app/entrypoint.sh" ]
CMD [ "rails", "server", "0.0.0.0" ]
