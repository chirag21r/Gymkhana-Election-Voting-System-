# IIIT Kalyani Gymkhana Voting System - Keepalive Guide

## 🚀 **Solution for Render Shutdown Issues**

Your Render service shuts down after inactivity because it's on the free tier. Here are multiple solutions to keep it alive:

## 📋 **Method 1: Update Render Configuration (Recommended)**

### 1. **Update Health Check Path in Render:**
- Go to your Render dashboard
- Click on your service `voting-app-ekks`
- Go to "Settings" tab
- Find "Health Check Path" section
- Change it to: `/keepalive`
- Save changes

### 2. **Redeploy with New Code:**
```bash
git add .
git commit -m "Add keepalive endpoint and update health check"
git push origin main
```

## 🔄 **Method 2: Automated Keepalive Script**

### **Run the Keepalive Script Locally:**
```bash
./keepalive.sh
```

This script will:
- Ping your service every 5 minutes
- Keep it awake and prevent shutdown
- Show status updates
- Run continuously until you stop it (Ctrl+C)

### **Run in Background (Linux/Mac):**
```bash
nohup ./keepalive.sh > keepalive.log 2>&1 &
```

## 🌐 **Method 3: External Keepalive Services**

### **Option A: UptimeRobot (Free)**
1. Go to [UptimeRobot](https://uptimerobot.com)
2. Create free account
3. Add new monitor:
   - **URL**: `https://voting-app-ekks.onrender.com/keepalive`
   - **Type**: HTTP(s)
   - **Interval**: 5 minutes
   - **Timeout**: 30 seconds

### **Option B: Pingdom (Free Trial)**
1. Go to [Pingdom](https://www.pingdom.com)
2. Set up monitoring for your service
3. Set 5-minute intervals

### **Option C: Cron Job (If you have a VPS)**
```bash
# Add to crontab (runs every 5 minutes)
*/5 * * * * curl -s https://voting-app-ekks.onrender.com/keepalive > /dev/null
```

## 📊 **Available Endpoints**

### **Keepalive Endpoint:**
- **URL**: `https://voting-app-ekks.onrender.com/keepalive`
- **Method**: GET or HEAD
- **Response**: JSON with status and timestamp
- **Purpose**: Lightweight health check

### **Debug Endpoint:**
- **URL**: `https://voting-app-ekks.onrender.com/debug`
- **Method**: GET
- **Response**: Full system information
- **Purpose**: Detailed diagnostics

## ⚙️ **Render Configuration Updates**

### **Updated render.yaml:**
```yaml
services:
  - type: web
    name: iiit-kalyani-voting-system
    env: docker
    dockerfilePath: ./Dockerfile
    dockerContext: .
    plan: free
    region: oregon
    branch: main
    envVars:
      - key: DB_URL
        sync: false
      - key: DB_USER
        sync: false
      - key: DB_PASS
        sync: false
      - key: PORT
        value: "8080"
    healthCheckPath: /keepalive
    autoDeploy: true
```

## 🔍 **About Those Warnings**

The warnings you see:
```
Invalid shutdown command [HEAD / HTTP/1.1] received
```

These are **normal and harmless**. They're just Render's health check system pinging your service. They don't affect functionality.

## ✅ **Recommended Setup**

1. **Update health check path** to `/keepalive` in Render dashboard
2. **Deploy the new code** with keepalive servlet
3. **Set up UptimeRobot** for automated monitoring
4. **Keep the keepalive script** as backup

## 🎯 **Expected Results**

- ✅ Service stays awake 24/7
- ✅ No more unexpected shutdowns
- ✅ Consistent availability for voting
- ✅ Proper health monitoring

---
**Service URL**: https://voting-app-ekks.onrender.com  
**Keepalive Endpoint**: https://voting-app-ekks.onrender.com/keepalive  
**Debug Endpoint**: https://voting-app-ekks.onrender.com/debug
