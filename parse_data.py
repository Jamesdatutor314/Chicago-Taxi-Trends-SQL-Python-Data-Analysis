import pandas as pd
import requests
from bs4 import BeautifulSoup

url = 'https://practicum-content.s3.us-west-1.amazonaws.com/data-analyst-eng/moved_chicago_weather_2017.html'

# Fetch the webpage content
req = requests.get(url)

# Parse the HTML content using BeautifulSoup
soup = BeautifulSoup(req.text, 'html.parser')

# Find the specific table using the attributes requested
table = soup.find('table', attrs={"id": "weather_records"})

# Extract the column headers (from <th> tags)
headers = []
for th in table.find_all('th'):
    headers.append(th.text)

# Extract the table rows (from <tr> and <td> tags)
content = []
for row in table.find_all('tr'):
    # We only want rows with standard data cells (<td>), skipping the header row
    if not row.find_all('th'):
        content.append([element.text for element in row.find_all('td')])

# Create the DataFrame with the required name
weather_records = pd.DataFrame(content, columns=headers)

# Print the DataFrame in its entirety
print(weather_records)