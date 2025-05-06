from abc import ABC, abstractmethod
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from robot.api.deco import keyword

class page_object_model(ABC):
    def __init__(self, driver, mandatory_elements, optional_elements = {}):
        self.driver = driver
        self.mandatory_elements = mandatory_elements
        self.optional_elements = optional_elements
        self.page_load_strategy()
    
    def page_load_strategy(self):
        wait = WebDriverWait(self.driver, 10)
        for key, selector in self.mandatory_elements.items():
            try:
                wait.until(EC.visibility_of_element_located((By.CSS_SELECTOR, selector)))
            except:
                raise Exception(f"Element {key} not found")

class login_page(page_object_model):
    def __init__(self, driver):
        mandatory = {
            'username': '#user-name',
            'password': '#password',
            'login_button': '#login-button'
        }
        optional = {
            'error_message': '.error-message-container'
        }
        super().__init__(driver, mandatory, optional)

    @keyword("Login with credentials")
    def login(self, username, password):
        self.driver.find_element(By.CSS_SELECTOR, self.mandatory_elements['username']).send_keys(username)
        self.driver.find_element(By.CSS_SELECTOR, self.mandatory_elements['password']).send_keys(password)
        self.driver.find_element(By.CSS_SELECTOR, self.mandatory_elements['login_button']).click()
    
    @keyword("Get error message")
    def get_error_message(self):
        try:
            return self.driver.find_element(By.CSS_SELECTOR, self.optional_elements['error_message']).text
        except:
            return None