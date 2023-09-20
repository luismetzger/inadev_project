# Application Setup Guide

This guide will walk you through the steps needed to set up and run the application using Docker.

## Step 1: Install Docker

Before you can run the application, you will need to install Docker. Follow the [official documentation](https://docs.docker.com/get-docker/) to install Docker on your operating system.

## Step 2: Clone the Repository

Clone the repository to your local machine using the following command:

```sh
git clone [REPOSITORY_URL] your_project_name
cd your_project_name
```

## Step 3: Build the Docker Containers
Build the Docker containers by running the following command from the root directory of your project:

```sh
docker compose build
```

## Step 4: Step 4: Set Up the Database
After building the containers, set up the database by running the following commands:

```sh
docker compose run web rake db:create
docker compose run web rake db:migrate
docker compose run web rake db:seed
```

## Step 5: Start the Application
Start the application by running:

```sh
docker compose up
```

The application should now be running and accessible at http://localhost:3000.

## Troubleshooting
### Local MySQL Socket Issue
If you encounter a local MySQL socket issue like the one below:

```vbnet
ActiveRecord::ConnectionNotEstablished (Can't connect to local MySQL server through socket '/run/mysqld/mysqld.sock' (2)):
```

You might need to install MySQL locally. You can do this using Homebrew with the following steps:

1. Install Homebrew (if not already installed) by following the official documentation.
2. Install MySQL using Homebrew:

```sh
brew install mysql
```

1. Start the MySQL server:

```sh
brew services start mysql
```

Try running the application again after performing these steps.
