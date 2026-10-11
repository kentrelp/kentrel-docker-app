# Assignment #4: Application Containerization

This is a simple Node.js web application designed for learning Docker containerization concepts.

## Application Overview

This application is a basic Express.js web server that:
- Serves a static HTML page at the root (`/`)
- Provides an API status endpoint at `/api/status`
- Includes a health check endpoint at `/health`
- Runs on port 3000 by default (configurable via PORT environment variable)

## What's Included

- **app.js**: Main application server file
- **package.json**: Node.js dependencies and project configuration
- **public/index.html**: Static HTML page that confirms successful containerization
- **public/style.css**: Styling for the web page

## Running Without Docker (for reference only)

If you wanted to run this application directly (not required for assignment):
```bash
npm install
npm start
```

## Your Docker Assignment

**DO NOT MODIFY THE APPLICATION CODE**

Your task is to containerize this existing application using Docker. You need to:

1. Create a `Dockerfile` that properly containerizes this Node.js application
2. Build a Docker image from your Dockerfile
3. Run a container from your image
4. Verify the application works by accessing it in your browser

## Starting the Application

- To build the docker image run the command:

```bash
docker build -t kentrel-docker-app .
```

- To run your docker container in port 3000 run the command:

```bash
docker run -d --name kentrel-docker-app -p 3000:3000 kentrel-docker-app
```

## Reflection Question
**Answer the following question in the space below**: How does containerization with Docker differ from using virtual machines, and why might a development team choose Docker containers over VMs for deploying applications like the one you just containerized?

Docker containers package an application with its runtime and dependencies while sharing the kernel of the operating system that runs the Docker engine. A virtual machine virtualizes hardware and runs a complete guest operating system with its own kernel. Containers generally use fewer resources and start faster because each application does not need a separate operating system. On macOS and Windows, Docker Desktop typically uses a Linux virtual machine to run Linux containers, so containers and VMs can work together.

For this Express application, the image includes Node.js, the installed dependencies, and the application files. Team members can run the same image without installing Node.js directly on their computers. This helps reduce differences between development, testing, and deployment environments. A development team might choose Docker because images are easy to distribute, deployment steps can be repeated, and multiple application instances can run efficiently. The team still needs to maintain its images and dependencies and configure networking correctly. VMs may be a better choice when an application requires a different operating-system kernel or stronger separation between workloads.

Reference: [Docker documentation on containers and virtual machines](https://docs.docker.com/get-started/docker-concepts/the-basics/what-is-a-container/).

## Application Requirements for Docker

Your Dockerfile should ensure:
- The application has Node.js runtime available
- All application files are copied into the container
- Dependencies are installed (`npm install`)
- Port 3000 is exposed
- The application starts with `npm start`
- The container can be accessed from your host machine

## Verification

When your Docker container is running correctly:
- Navigate to `http://localhost:3000` (or whatever port you mapped)
- You should see a success page confirming containerization worked
- The `/api/status` endpoint should return JSON status information

## Troubleshooting Tips

- Make sure your port mapping is correct in the `docker run` command
- Check that all files are copied into the container
- Verify Node.js dependencies are installed in the container
- Use `docker logs <container-name>` to see application output

## File Structure Expected
```
docker-assignment/
├── Dockerfile          # You create this
├── app.js              # Provided
├── package.json        # Provided
├── public/             # Provided
│   ├── index.html      # Provided
│   └── style.css       # Provided
└── README.md           # This file
```

Good luck with your Docker containerization!

## Container Management

Run these commands after building and starting the container:

```bash
# List running containers.
docker ps

# Stop the container gracefully.
docker stop kentrel-docker-app

# Restart the existing stopped container.
docker start kentrel-docker-app

# Stop it before removing it.
docker stop kentrel-docker-app

# Remove the stopped container; the image remains available.
docker rm kentrel-docker-app
```

## Screenshots and Verification Status

Direct Node.js checks passed for `/`, `/api/status`, and `/health`; these are application checks, not container checks. Docker is unavailable in the preparation environment, so the image build and container run have not been verified here. The commands above are the planned commands to execute on a machine with Docker Desktop running.

After running the container, open both URLs and save real browser screenshots in a `screenshots` folder:

- `http://localhost:3000` → `screenshots/application.png`
- `http://localhost:3000/api/status` → `screenshots/api-status.png`

Commit the screenshots after verifying both pages. The starter application displays a containerization success message even when run directly with Node.js, so that message alone does not prove Docker was used.
