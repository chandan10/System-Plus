
# Bright Horizons Test Automation

This project contains UI automation test using Robot Framework and SeleniumLibrary.

## Prerequisites
- **Python** (Install Python 3.7.9 or higher )

## Setup
1. Clone the repository.
2. Install dependencies by running:
   ```bash
   pip install -r pip-requirements.txt
   ```

## Running Tests
Run the tests using the following command:
```bash
cd Bright_Horizons
```

## Different ways of execution
### Run all test under tests directory
```bash
robot --outputdir results --timestampoutputs tests/
```
### Tag based execution
```bash
robot --outputdir results --timestampoutputs -i Sanity tests/
```
### Parallel test execution
```bash
pabot --outputdir results tests/
```

## Folder Structure
- `tests/`: Contains the Robot Framework test cases which is simple and readable.
- `resources/`: Contains keywords and reusable components.
- `locators/` : Contains all UI element locators separately for better maintainability.
- `variables/` : Environment specific variables.
- `liraries/` : Contains python libraries for complex logic which is not easily achievable with Robot Framework. Also have resource_libraries.robot file to centralize imports.
- `results/` : Folder contains test execution logs, reports and screenshots.
  - `report.html` : It shows high level execution summary about test execution.
  - `log.html` : It shows detail execution summary about test execution.
  - `output.xml` : This file has all details about test execution. Above html files are generated from this file.'
- `config.robot` : This file is used to set global settings.
- `pip-requirements.txt` : This file has all dependencies (e.g. robotframework, selenium, etc)

## Features
- `Libraries` :
  - `SeleniumLibrary` : Supported for browser automation.
  - `RequestsLibrary` : Supported for API interaction.
  - `DatabaseLibrary` : Supported for database validations.
- `Continuous Integration` : Easy integrate with CI tools (e.g. Gitlab, Jenkins, etc.)
- `Reporting` : Gives screenshots on failure which will be easy to understand reason for failure.
---

