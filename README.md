# 🚀 AWS Lambda Deployment using GitHub Actions (CI/CD)

This project automates the deployment of an AWS Lambda function using **GitHub Actions CI/CD**. The function fetches a random joke from a public jokes API and updates automatically whenever code is pushed to GitHub.

---

## **📌 Steps to Deploy AWS Lambda Automatically**
### **1️⃣ Prerequisites**
Before you begin, make sure you have:
✅ **AWS Account**   
✅ **IAM User with AWS Access Keys**  
✅ **GitHub Repository** to push the code  

---

### **2️⃣ Create AWS Credentials for GitHub Actions**
GitHub Actions requires **AWS_ACCESS_KEY_ID** and **AWS_SECRET_ACCESS_KEY** to deploy the Lambda function.

#### **Step 1: Create an IAM User in AWS**
1. Go to **AWS Console → IAM → Users**.
2. Click **Add User** and enter a name (e.g., `GitHubLambdaDeployment`).
3. Check **Programmatic Access**.
4. Click **Next: Permissions**.

#### **Step 2: Attach Permissions**
Attach the following policies:
- ✅ `AWSLambdaFullAccess` (Allows Lambda function management)


Click **Next: Tags** → **Next: Review** → **Create User**.

#### **Step 3: Get Access Keys**
- **Copy the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`**.
- These credentials **will not be shown again**, so save them securely.

#### **Step 4: Add Secrets to GitHub**
1. Go to **GitHub Repository → Settings → Secrets and Variables → Actions**.
2. Click **"New Repository Secret"** and add:
   - `AWS_ACCESS_KEY_ID` → Paste the Access Key
   - `AWS_SECRET_ACCESS_KEY` → Paste the Secret Key

---

### **3️⃣ Write AWS Lambda Function**
Create a new directory and add a **Lambda function** that fetches a random joke.
### **4️⃣ Test AWS Lambda Function**

**Test Using AWS Lambda Console**

1. Go to **AWS Lambda Console → AWS Lambda**.

2. Search for **cicdLambdatest and click on it**.

3. Click the **"Test"** button at the top.

4. Enter a test event (or leave it empty) and click "Invoke".

Check the response and logs in the console.

📌 **Expected Output:**
```json
{
  "statusCode": 200,
  "body": "{\"joke\": \"Why don't skeletons fight each other? - They don't have the guts.\"}"
}
```

### **Github actions workflow**
Check in the actions tab for workflow job status

https://github.com/saysudheer/lambdatestcicd/blob/main/image.png
