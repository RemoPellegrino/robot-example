from page_checks import page_checks
from selenium.common.exceptions import NoSuchElementException

class inventory_page_methods:
    mandatory = {
        'inventory_container': '#inventory_container.inventory_container',
        'menu_button_container': '#menu_button_container',
        'menu_button': '#menu_button_container .bm-burger-button>button'
    }

    @staticmethod
    def is_on_inventory_page():
        return page_checks.is_on_page(inventory_page_methods.mandatory)
    
