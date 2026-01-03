# FlaskOps Deployment Workflow on AWS EC2


## Project Overview
This project demonstrates an end-to-end CI/CD pipeline for deploying a Python Flask app on AWS EC2. The pipeline automatically provisions infrastructure with Terraform, configures the server with Ansible, deploys the Flask app, and validates endpoints using Python scripts.


## Workflow Diagram

```text
GitHub Repository (Flask App + Workflow)
           │
           ▼
   GitHub Actions Workflow
      - Terraform: Provision EC2 + SG
      - Ansible: Configure EC2, deploy Flask app
      - Python Validation Script
           │
           ▼
        AWS EC2 Instance
           │
           ▼
   Flask Application Endpoints
      → /health, /hello

```


## Tools & Concepts Used
- ![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?logo=github-actions&logoColor=white)  
  CI/CD → workflows, jobs, secrets management  
- ![Terraform](https://img.shields.io/badge/Terraform-623CE4?logo=terraform&logoColor=white)  
  Infrastructure as Code (EC2, Security Group, S3 backend)  
- ![Ansible](https://img.shields.io/badge/Ansible-EE0000?logo=ansible&logoColor=white)  
  Server configuration, systemd service setup, app deployment  
- ![Python](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white)  
  Flask app and automation scripts  
- ![AWS S3](https://img.shields.io/badge/AWS_S3-569A31?logo=amazon-aws&logoColor=white)  
  Terraform state storage  
- ![AWS EC2](https://img.shields.io/badge/AWS_EC2-FF9900?logo=amazon-aws&logoColor=white)  
  EC2 instance hosting the Flask application  

## Features
- Automated CI/CD pipeline with GitHub Actions  
- Infrastructure provisioning with Terraform
- Flask app deployment via Ansible
- Health-check validation using Python script


## Repository Structure

```text
FlaskOps/
├── app/
│   ├── app.py
│   ├── requirements.txt
│   └── tests/
│       ├── test_app.py
│       └── validate.py
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── backend.tf
├── ansible/
│   ├── ansible.cfg
│   ├── playbook.yml
│   └── templates/
│       └── flaskapp.service.j2
├── .github/
│   └── workflows/
│       └── pipeline.yml
└── README.md

```


## Screenshots 

### GitHub Actions Workflow Run
<img width="1865" height="506" alt="image" src="https://github.com/user-attachments/assets/bed9f96d-a02e-4110-b9e3-a4646c2a9755" />

### Terraform Output
<img width="1130" height="132" alt="Screenshot 2025-12-13 162646" src="https://github.com/user-attachments/assets/768b82f7-d851-46e5-bbe8-1ac657f69e2d" />

### Ansible Logs
<img width="1087" height="492" alt="ultimat2" src="https://github.com/user-attachments/assets/b0e9f873-3947-42fd-b7ed-b6c0614e3eb8" />

### AWS S3 Bucket
<img width="1880" height="605" alt="Screenshot 2025-12-13 163105" src="https://github.com/user-attachments/assets/e30560dc-f7e6-4937-852b-8f55ee2e2b16" />

### AWS EC2 Instance
<img width="1569" height="672" alt="Screenshot 2025-12-13 163308" src="https://github.com/user-attachments/assets/ba8daf51-f458-4c66-9c5e-7ddf7e567949" />

### Endpoint Response
<img width="1501" height="825" alt="ultimate" src="https://github.com/user-attachments/assets/7ff1e43d-0bfd-458f-8afe-20de4618ad06" />
