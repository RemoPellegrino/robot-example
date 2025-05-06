from page_checks import page_checks
from selenium.common.exceptions import NoSuchElementException
class login_page_methods:
    
    mandatory = {
        'username': '#user-name',
        'password': '#password',
        'login_button': '#login-button'
    }
    @staticmethod
    def is_on_login_page():
        return page_checks.is_on_page(login_page_methods.mandatory)
    
    @staticmethod
    def log_in(username, password):
        try:
            items = login_page_methods.mandatory
            driver = page_checks.get_driver()
            driver.find_element('css selector', items['username']).send_keys(username)
            driver.find_element('css selector', items['password']).send_keys(password)
            driver.find_element('css selector', items['login_button']).click()
            return True
        except Exception as e:
            print(f'An unexpected error occurred: {e}')
            return False
        
    @staticmethod
    def retrieve_error_message():
        if not login_page_methods.is_on_login_page():
            return None
        try:
            driver = page_checks.get_driver()
            error_message = driver.find_element('css selector', '.error-message-container').text
            return error_message
        except NoSuchElementException:
            print('Error message element not found')
            return None
        except Exception as e:
            print(f'An unexpected error occurred: {e}')
            raise e