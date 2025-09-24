#!/bin/bash

# IIIT Kalyani Gymkhana Voting System - PostgreSQL Deployment Script
# Author: Chirag Shukla

echo "🚀 Starting deployment of IIIT Kalyani Gymkhana Voting System with PostgreSQL..."

# Build the application
echo "📦 Building Maven project..."
mvn clean package -DskipTests

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    
    # Build Docker image
    echo "🐳 Building Docker image..."
    docker build -t voting-system-postgres .
    
    if [ $? -eq 0 ]; then
        echo "✅ Docker image built successfully!"
        
        # Run the container
        echo "🚀 Starting application container..."
        docker run -d -p 8080:8080 --name voting-system voting-system-postgres
        
        if [ $? -eq 0 ]; then
            echo "✅ Application started successfully!"
            echo "🌐 Application is available at: http://localhost:8080"
            echo "👤 Admin Login:"
            echo "   Email: admin"
            echo "   Password: admin"
            echo ""
            echo "📊 Database: PostgreSQL (Neon Cloud)"
            echo "🔗 Connection: ep-raspy-dream-adohxgvs-pooler.c-2.us-east-1.aws.neon.tech"
        else
            echo "❌ Failed to start application container!"
        fi
    else
        echo "❌ Docker build failed!"
    fi
else
    echo "❌ Maven build failed!"
fi

echo "🏁 Deployment script completed!"
