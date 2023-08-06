import os
import subprocess

def run_robot_tests(test_file, browser_name, browser_version):
    # Replace 'http://selenoid-grid-url' with the actual URL of your Selenoid grid.
    selenoid_url = "http://localhost:4444/wd/hub"
    
    # Run Robot Framework tests using SeleniumLibrary with Selenoid
    command = f"robot --listener Browser --variable BROWSER:{browser_name} --variable BROWSER_VERSION:{browser_version} --variable SELENOID_URL:{selenoid_url} {test_file}"
    
    # If you have additional arguments or options to pass, you can add them to the command above.
    # For example, to set a specific output directory, you can use: '--outputdir /path/to/directory'
    
    try:
        subprocess.run(command, shell=True, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error while running Robot Framework tests: {e}")
        exit(1)

if __name__ == "__main__":
    # Specify the path to your Robot Framework test file here.
    robot_test_file = "test/web/init.robot"
    
    if not os.path.isfile(robot_test_file):
        print(f"Error: Test file '{robot_test_file}' not found.")
        exit(1)
    
    # Specify the desired browser and browser version here.
    browser_name = "chrome"
    browser_version = "latest"  # You can set the version you want here.
    
    run_robot_tests(robot_test_file, browser_name, browser_version)
