# Stage 1: Build the Go binary
FROM golang:1.22-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy source code
COPY . .

# Build the Go app
RUN go build -o main .

# Stage 2: Final image
FROM alpine:latest

WORKDIR /root/
COPY --from=builder /app/main .

EXPOSE 8080

# Command to run the binary
CMD ["./main"]
