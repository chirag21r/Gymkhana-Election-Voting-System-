    # IIIT Kalyani Gymkhana Voting System - Render Deployment Guide

## 🚀 Quick Deployment Steps

### 1. Prepare Your Repository
- Ensure all files are committed to your Git repository
- Push to GitHub/GitLab (Render supports both)

### 2. Create Render Service
1. Go to [Render Dashboard](https://dashboard.render.com)
2. Click "New +" → "Web Service"
3. Connect your Git repository
4. Configure the service:
   - **Name**: `iiit-kalyani-voting-system`
   - **Environment**: `Docker`
   - **Dockerfile Path**: `./Dockerfile`
   - **Docker Context**: `.`
   - **Plan**: `Free` (or choose your preferred plan)
   - **Region**: `Oregon (US West)` (or closest to your users)

### 3. Set Environment Variables
In the Render dashboard, go to your service → Environment tab and add:

```
DB_URL=jdbc:postgresql://ep-raspy-dream-adohxgvs-pooler.c-2.us-east-1.aws.neon.tech:5432/votingappj2ee?sslmode=require&channel_binding=require
DB_USER=neondb_owner
DB_PASS=npg_GtmIJp9VjD8A
```

**Note**: Render will automatically set the `PORT` environment variable.

### 4. Deploy
- Click "Create Web Service"
- Render will automatically build and deploy your application
- Wait for the build to complete (usually 5-10 minutes)

## 🔧 Configuration Details

### Dockerfile Configuration
- Uses multi-stage build for efficiency
- Deploys WAR file as ROOT.war for direct access
- Automatically configures port based on Render's PORT variable
- Includes PostgreSQL driver and all dependencies

### Database Connection
- Uses your existing Neon PostgreSQL database
- SSL enabled for secure connections
- Connection pooling for better performance

### Application Access
- **URL**: `https://your-app-name.onrender.com`
- **Admin Login**: 
  - Email: `admin`
  - Password: `admin`

## 📋 Features Included
- ✅ User registration and authentication
- ✅ Admin dashboard with real-time vote counting
- ✅ Candidate management
- ✅ Secure voting system (one vote per user)
- ✅ PostgreSQL database integration
- ✅ Responsive UI with Bootstrap

## 🔍 Troubleshooting

### Build Issues
- Check that all files are committed to Git
- Ensure Dockerfile is in the root directory
- Verify Maven dependencies are correct

### Database Connection Issues
- Verify environment variables are set correctly
- Check that your Neon database is accessible
- Ensure SSL settings are correct

### Application Not Loading
- Check Render logs for errors
- Verify the application is deployed as ROOT.war
- Ensure all JSP files are included in the WAR

## 📊 Monitoring
- View logs in Render dashboard
- Monitor database connections
- Check application health status

## 🔄 Updates
- Push changes to your Git repository
- Render will automatically redeploy
- No manual intervention required

## 📞 Support
- Check Render documentation: https://render.com/docs
- Review application logs for specific errors
- Ensure all environment variables are properly set

---
**Created by**: Chirag Shukla  
**For**: IIIT Kalyani Gymkhana Elections 2024  
**Database**: PostgreSQL (Neon Cloud)  
**Platform**: Render
