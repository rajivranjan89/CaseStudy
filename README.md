# Terraform code to deploy three-tier architecture on azure

## What is three-tier architecture?
Three-tier architecture is a well-established software application architecture that organizes applications into three logical and physical computing tiers: the presentation tier, or user interface; the application tier, where data is processed; and the data tier, where the data associated with the application is stored and managed.

## What is terraform?
Terraform is an open-source infrastructure as code software tool created by HashiCorp. Users define and provision data center infrastructure using a declarative configuration language known as HashiCorp Configuration Language, or optionally JSON.

## Installation
- [Terraform](https://www.terraform.io/downloads.html)

## Problem Statement

### A 3-tier environment is a common setup



## Solution

### The Terraform resources will consists of following Azure Component

<img width="660" alt="image" src="https://user-images.githubusercontent.com/51155706/215305150-5fe786a5-4e5e-4c0f-8a49-7051391f91af.png">

### Module

A module is a container for multiple resources that are used together. Modules can be used to create lightweight abstractions, so that you can describe your infrastructure in terms of its architecture, rather than directly in terms of physical objects.

For the solution, we have created and used five modules:
1. networking - creating azure virtual network and required subnets
2. securitygroup - creating network security group, setting desired security rules and associating them to subnets
3. compute - creating availability sets, network interfaces and virtual machines
4. database - creating database server and database

All the stacks are placed in the modules folder

### Steps

**Step 0** `terraform init`

used to initialize a working directory containing Terraform configuration files

**Step 1** `terraform plan`

used to create an execution plan

**Step 2** `terraform validate`

validates the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs, etc

**Step 3** `terraform apply`

used to apply the changes required to reach the desired state of the configuration
