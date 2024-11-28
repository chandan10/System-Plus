import os
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager


def get_chromedriver_path():
    driver_path = ChromeDriverManager().install()
    folder = os.path.dirname(driver_path)
    driver_path = os.path.join(folder, "chromedriver.exe")
    print(driver_path)
    return driver_path


def get_gekodriver_path():
    driver_path = GeckoDriverManager().install()
    print(driver_path)
    return driver_path
