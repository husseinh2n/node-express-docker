# 🐳 node-express-docker

Welcome! This is a friendly, hands-on learning project designed to help you take your first steps into DevOps. Here, you'll learn how to take a simple Node.js application, wrap it in a Docker container, orchestrate it with Docker Compose, and set up basic continuous integration (CI).

No prior DevOps experience is required—just open your terminal and let's dive in!

---

## What this project does
This project runs a lightweight Express.js web server inside an isolated Docker container so it can run identically on your laptop, a teammate's computer, or a cloud server. It uses Docker Compose to make starting and stopping the app a single-command experience, while automated tests ensure everything stays healthy.

---

## What you will learn
* **Containerization:** How to write a `Dockerfile` to package a Node.js app and its dependencies.
* **Orchestration:** How to use `docker-compose.yml` to manage multi-container applications easily.
* **Best Practices:** How to keep your Docker images lean using `.dockerignore`.
* **Testing:** How to write basic automated scripts and Python tests to verify container health.
* **CI/CD Basics:** How GitHub Actions can automatically run tests whenever you push code.

---

## Prerequisites
Before you begin, make sure you have the following tools installed on your machine:

* **Git** (to clone the repository)
* **Docker & Docker Compose** (to run containers)

### Installation Commands

**macOS** (using Homebrew):