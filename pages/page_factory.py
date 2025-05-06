from robot.api.deco import keyword
from selenium import webdriver
from page_object_model import login_page

class page_factory:
    @staticmethod
    @keyword("Go to login page")
    def get_login_page(browser, base_url):
        driver = page_factory._create_driver(browser)
        driver.get(base_url)
        return login_page(driver)

    @staticmethod
    def _create_driver(browser):
        if browser.lower() == "chrome":
            return webdriver.Chrome()
        elif browser.lower() == "firefox":
            return webdriver.Firefox()
        else:
            raise ValueError(f"Unsupported browser: {browser}")
