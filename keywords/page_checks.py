from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import NoSuchElementException
from robot.libraries.BuiltIn import BuiltIn

class page_checks:
    @staticmethod
    def get_driver():
        return BuiltIn().get_library_instance("SeleniumLibrary").driver
    
    @staticmethod
    def is_on_page(mandatory_elements):
        driver = page_checks.get_driver()
        wait = WebDriverWait(driver, 10)
        for key, selector in mandatory_elements.items():
            print(selector)
            try:
                _ = wait.until(EC.visibility_of_element_located((By.CSS_SELECTOR, selector)))
                print(f'Found {key}')
            except NoSuchElementException as nse:
                print(f'Element {key} not found: {nse}')
            except Exception as e:
                print(f'An unexpected error occurred: {e}')
                return False
        return True
    
    @staticmethod
    def is_on_login_page():
        mandatory = {
            'username': '#user-name',
            'password': '#password',
            'login_button': '#login-button'
        }
        return page_checks.is_on_page(mandatory)
    