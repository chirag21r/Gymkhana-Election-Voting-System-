#!/bin/bash

# IIIT Kalyani Gymkhana Voting System - Build Script for Render
# This script prepares the application for Render deployment

echo "🚀 Building IIIT Kalyani Gymkhana Voting System for Render..."

# Clean and build the project
echo "📦 Building Maven project..."
mvn clean package -DskipTests

if [ $? -eq 0 ]; then
    echo "✅ Maven build successful!"
    
    # Test Docker build
    echo "🐳 Testing Docker build..."
    docker build -t voting-system-render .
    
    if [ $? -eq 0 ]; then
        echo "✅ Docker build successful!"
        echo ""
        echo "🎉 Application is ready for Render deployment!"
        echo ""
        echo "📋 Next steps:"
        echo "1. Push your code to Git repository"
        echo "2. Go to https://dashboard.render.com"
        echo "3. Create new Web Service"
        echo "4. Connect your repository"
        echo "5. Set environment variables (see environment-variables.txt)"
        echo "6. Deploy!"
        echo ""
        echo "📖 For detailed instructions, see RENDER_DEPLOYMENT.md"
    else
        echo "❌ Docker build failed!"
        exit 1
    fi
else
    echo "❌ Maven build failed!"
    exit 1
fi
