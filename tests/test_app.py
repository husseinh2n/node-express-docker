import subprocess
import time
import requests
import pytest

# Setup and teardown for Docker Compose integration tests
@pytest.fixture(scope="module", autouse=True)
def docker_compose_env():
    """
    Setup: Build and start the Docker containers using docker-compose before tests run.
    Teardown: Stop and remove containers after all tests in this module complete.
    """
    # Start containers in detached mode and build if necessary
    subprocess.run(["docker-compose", "up", "-d", "--build"], check=True)
    
    # Wait a few seconds for the Express server to fully start up inside the container
    time.sleep(3)
    
    yield
    
    # Teardown: Stop and remove containers, networks, and volumes
    subprocess.run(["docker-compose", "down"], check=True)

def test_homepage_happy_path():
    """
    Verifies that the Express.js application is running inside Docker 
    and returns a successful HTTP 200 response with the expected greeting.
    """
    url = "http://localhost:3000"
    
    try:
        response = requests.get(url)
    except requests.exceptions.ConnectionError:
        pytest.fail("Could not connect to the Express app running on localhost:3000")

    # Assert that the server responded successfully
    assert response.status_code == 200
    
    # Assert that the response contains the expected text from server.js
    # (Assuming the default template returns a welcome message or JSON)
    assert "Hello" in response.text or "Express" in response.text

def test_404_failure_case():
    """
    Verifies that requesting a non-existent route on the Express server 
    correctly returns a 404 Not Found error (negative test case).
    """
    url = "http://localhost:3000/this-route-definitely-does-not-exist"
    
    response = requests.get(url)
    
    # Assert that the server handles missing routes with a 404 status code
    assert response.status_code == 404