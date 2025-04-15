# Ruby API with Roda and Falcon

A simple Ruby web API using Roda as the routing framework and Falcon as the web server, with HTTPS support.

## Setup

1. Install dependencies:
```bash
bundle install
```

## Running the server

Start the server using Falcon:
```bash
bundle exec falcon serve
```

The server will start on port 9292 by default with HTTPS enabled.

## Testing the API

You can test the Hello World endpoint using curl (note the -k flag to accept self-signed certificates):
```bash
curl -k https://localhost:9292/
```

Expected response:
```json
{"message":"Hello, World!"}
```

Note: The -k flag is only needed because we're using a self-signed certificate for development. In production, you should use proper SSL certificates.
