# tF_Project7_staticWebsite

Static Website Deployment on AWS using Terraform
Project Overview
This project demonstrates how to deploy a static website on AWS infrastructure using Terraform. By leveraging Terraform's Infrastructure as Code (IaC) capabilities, the website will be hosted on AWS using various services such as Amazon S3, CloudFront, Route 53, and ACM (AWS Certificate Manager) for SSL certificates. This setup ensures a scalable, reliable, and secure hosting environment for your static content.

Objective
The goal of this project is to create a simple, cost-effective static website using AWS services, automated and configured through Terraform scripts. This method provides repeatable and predictable infrastructure deployment, with version control and minimal human intervention.

Prerequisites
Before starting the deployment, ensure that you have the following:

AWS Account: You need an active AWS account to create resources on AWS.
Terraform: Terraform needs to be installed locally. Make sure to have the latest stable version of Terraform installed.
AWS CLI: The AWS Command Line Interface (CLI) needs to be configured with your credentials for Terraform to authenticate and provision AWS resources.
Domain Name (Optional): If you intend to use a custom domain for your static website, you'll need to configure DNS settings (this can be handled through AWS Route 53 or any other DNS provider).
Architecture
The infrastructure for this project includes:

CloudFront will be used as a Content Delivery Network (CDN) to deliver your static assets globally with low latency.
It caches the content in edge locations, improving website performance and availability.
AWS Certificate Manager (ACM):

ACM will be used to provision an SSL certificate for the website to enable HTTPS (secure) traffic.
Route 53 (Optional):

If you're using a custom domain, AWS Route 53 will handle DNS management, creating an alias record pointing to the CloudFront distribution.
Features
Scalable Hosting: Amazon S3 automatically scales to handle growing web traffic without manual intervention.
Security: Secure communication over HTTPS using ACM-provided SSL certificates.
Content Delivery: Faster content delivery through CloudFront's global edge locations.
Automation: Infrastructure deployment is automated using Terraform, ensuring consistency and ease of use.
Cost-Effective: By using S3, CloudFront, and Route 53 (if applicable), you leverage AWS's pay-as-you-go pricing model for cost-effective website hosting.
Steps to Deploy the Website
1. Configure AWS Credentials
Ensure that your AWS CLI is set up with proper IAM credentials. Terraform will use these credentials to interact with AWS services.

2. Initialize Terraform
Run the terraform init command in your project directory to initialize Terraform and download the necessary providers.

3. --

4. Upload Website Content
Once the infrastructure is created, you can manually or programmatically upload the static content (HTML, CSS, JS, images) to the S3 bucket.

5. Set Up CloudFront Distribution
A CloudFront distribution will be created with the S3 bucket as its origin. This distribution will serve the static website from the nearest edge location to the user, reducing latency and improving performance.

6. Configure SSL with ACM
Terraform will provision an SSL certificate using AWS Certificate Manager. This certificate will be used with the CloudFront distribution to ensure that the website is served over HTTPS.

7. Set Up Domain (Optional)
If you have a custom domain, you can configure Route 53 to manage your DNS records. Terraform can automate this process by creating an alias record pointing to the CloudFront distribution.

8. Apply Terraform Configuration
After all configurations are made, you can use the terraform apply command to apply the infrastructure changes. This will provision the necessary AWS resources and make your static website available online.

Cleanup
To tear down the resources created during the deployment, run the following Terraform command:

terraform destroy

This will safely remove the S3 bucket, CloudFront distribution, Route 53 records (if used), and ACM certificate. Be sure to backup any website files stored in S3 before running the destroy command.

Benefits of Using Terraform
Infrastructure as Code: The entire infrastructure is defined in code, which can be versioned, reviewed, and shared with others.
Consistency: The same configuration can be applied across different environments (development, staging, production) with minimal changes.
Automation: Deployment and updates to the infrastructure are automated, reducing the potential for human error and ensuring consistency.
Resources
Terraform Documentation
AWS Documentation
AWS S3 Static Website Hosting
AWS CloudFront
AWS Route 53
AWS Certificate Manager (ACM)

Links 

Terraform Documentation: https://www.terraform.io/docs
AWS Documentation: https://aws.amazon.com/documentation/
AWS S3 Static Website Hosting: https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html
AWS CloudFront Documentation: https://docs.aws.amazon.com/cloudfront/
AWS Route 53 Documentation: https://docs.aws.amazon.com/route53/
AWS Certificate Manager (ACM) Documentation: https://docs.aws.amazon.com/acm/

License
This project is licensed under the MIT License - see the LICENSE file for details.

This readme provides a comprehensive overview and detailed steps to deploy your static website on AWS using Terraform. If you need further adjustments or specific points to be added, let me know!