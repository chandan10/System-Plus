*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String
Resource   ../resources/ui_generic_keywords.robot
Resource   ../locators/search_page.robot
Resource   ../variables/env_variables.robot
Resource   ../locators/find_center_page.robot
Resource   ../config.robot
Library    custom_library.py