# The base go-image, using latest stable version when this was written
FROM golang:1.15.7-alpine3.13

RUN apk add git

RUN mkdir /app
COPY . /app
WORKDIR /app
# Install the go-cache library we are using in our application
RUN go get github.com/patrickmn/go-cache
# go build will build an executable file named main in the current directory
RUN go build -o main .
# Run the generated "main" executable
CMD [ "/app/main" ]