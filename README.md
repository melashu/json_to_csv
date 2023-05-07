
<a name="readme-top"></a>


# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 JSON\_to\_CSV ](#-json_to_csv-)
  - [Why we need to use SQLite database](#why-we-need-to-use-sqlite-database)
  - [Tech Stack ](#tech-stack-)
  - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Usage](#usage)
      - [Using `/convert` endpoint](#using-convert-endpoint)
      - [Using `/convert/previous` endpoint](#using-convertprevious-endpoint)
    - [Run tests](#run-tests)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)

# 📖 JSON_to_CSV <a name="about-project"></a>

JSON_to_CSV is a Rails API that converts an array of objects to a CSV-formatted string. It has two endpoints: `/convert` and `/convert/previous`.

To minimize the error rate when converting an array of objects to CSV-formatted data, the API uses an Employee model with the following attributes: `fname`, `lname`, `salary`, `company`, and `position`.

To convert data, the user sends a POST request to the `/convert` endpoint with an array of objects as the payload. The objects must have the above attributes as keys. The `/convert` endpoint persists the data to a SQLite database and responds with a CSV-formatted string.

To access previously converted data, the user need to sends GET request to `/convert/previous` endpoint.

## Why we need to use SQLite database
To allow users to view previous data, we use a SQLite database to persist the data when we convert it for the first time. So user can view persisted data using `/convert/previous` endpoint.
 
## Tech Stack <a name="tech-stack"></a>

To complete this task I used the following tools 
  - Ruby on Rails
  - RSpec
  - SQLite Database
    
## Key Features <a name="key-features"></a>
The key features of this API

- Converts JSON-formatted arrays of objects to CSV-formatted data
- Persists the data for future use
- Allows users to view previously converted data
## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps

### Prerequisites

- Install [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- Install [Ruby on Rails](https://rubyinstaller.org/)
- Install [Postman](https://www.postman.com/downloads/) or other API testing tool
- Install [Visual Studio Code](https://code.visualstudio.com/download) or other code editor

### Setup

Clone this repository to your desired folder:

`https://github.com/melashu/json_to_csv.git`

cd `json_to_csv`

Run `bundler install`

Run `rails server` or `rails s`

### Usage

#### Using `/convert` endpoint 

To convert data to CSV formated-string, open Postman or other API testing tool, then put `server_address/convert` to the url section and make the request type `POST`

> NB: server_address may be like http://127.0.0.1:3000 e.g. `http://127.0.0.1:3000/convert`

Under body section select raw, then copy and put the following JSON formated data as a payload 

````
{
  "data": [
    { "id": 1,
      "fname": "Marek",
      "lname": "Vydareny",
      "salary": 4500,
      "company": "Radar Cyber Security",
      "position": "DevOps IT Operations"
    },
    
    { "id": 2,
      "fname": "Norbert",
      "lname": "Szivós",
      "salary": 5000,
      "company": "Radar Cyber Security",
      "position": "Rails Developer"
    },
    {
      "id": 3,
      "fname": "Ákos",
      "lname": "Balogh",
      "salary": 5000,
      "company": "Radar Cyber Security",
      "position": "Senior Sofware Developer"
    }
  ]
}

````
Then click `send` button 

> NB: Dont forget the objects must have `fname`, `lname`, `salary`, `company`, and `position` attributes as keys. Otherwise, the server will responed `Either the id is duplicted or invalid format,try /convert/previous to see previous data` but you can leave `id` attribute

The response looks like 

![image](https://user-images.githubusercontent.com/30173722/236670626-56fe50e3-9f8e-4987-a29b-4fa0f852d48c.png)

#### Using `/convert/previous` endpoint

To view previously converted data, open Postman or other API testing tool, then put `server_address/convert/previous` to the url section and make the request type `GET`

> E.g. `http://127.0.0.1:3000/convert/previous`

If there is previously converted data, the server will responed it as CSV-formated data, otherwise it will responed `No data avaliable` message.

### Run tests

Run 

`rails db:migrate RAILS_ENV=test` 
 to change the enviroment to testing mode, then run `rspec spec `

## 👥 Authors <a name="authors"></a>

 👤 Melashu Amare

- GitHub: [@melashu](https://github.com/melashu)
- Twitter: [@meshu102](https://twitter.com/meshu102)
- LinkedIn: [Melashu Amare](https://www.linkedin.com/in/melashu-amare/)

## 🔭 Future Features <a name="future-features"></a>

> I would recommend improvement on the following features.

- [ ] Add more model validation like checking the length of character, salary must be number
- [ ] Allow the API to convert any json formated object
  
<p align="right">(<a href="#readme-top">back to top</a>)</p>
