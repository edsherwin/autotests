from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from robot.libraries.BuiltIn import BuiltIn
import subprocess

def run_robot_tests_with_selenoid(test_file):
    capabilities = {
        "browserName": "chrome",
        "browserVersion": "latest",
        "selenoid:options": {
            "enableVideo": False
        }
    }

    # Replace <WSL_host_ip> with the actual IP address of your WSL 2 host
    docker_host_ip = "172.25.176.1"
    docker_host_url = "http://localhost:4444/wd/hub"

    options = webdriver.ChromeOptions()
    options.add_argument('--no-sandbox')

    driver = webdriver.Remote(
        command_executor=docker_host_url,
        options=options
    )

    # Set desired capabilities
    driver.desired_capabilities = capabilities

    # Rest of your code...

if __name__ == "__main__":
    test_file_to_run = "test/web/int.robot"
    run_robot_tests_with_selenoid(test_file_to_run)
