# Google Analytics Reporting Application Example Built with Ruby and Sinatra framework 

This is a simple web application built using Ruby and Sinatra that allows users to retrieve and display Google Analytics data based on a selected date range. The application utilizes the Google Analytics Reporting API to fetch data such as sessions and pageviews.

## Features

- User-friendly interface to select date ranges.
- Displays sessions and pageviews for the selected dates.
- Built with Ruby and Sinatra framework.

## Prerequisites

Before you begin, ensure you have the following installed:

- Ruby (version 2.5 or higher)
- Bundler
- Google Cloud account with access to Google Analytics

## Getting Started

### 1. Clone the repository

Clone this repository to your local machine:

```bash
git clone https://github.com/yourusername/google_analytics_app.git
cd google_analytics_app
```
### 2. Set up Google Cloud

Follow these steps to set up your Google Cloud environment:

- Go to the [Google Cloud Console](https://console.cloud.google.com/)
- Create a new project.
- Enable the Google Analytics Reporting API.
- Create a Service Account and download the `credentials.json` file.
- Share your Google Analytics view with the service account email.

### 3. Install dependencies

Make sure you have Bundler installed. Then run:

```bash
bundle install
```
### 4. Configure the application

- Move the downloaded `credentials.json` file to the `config` directory.
- Open app.rb and update the `CREDENTIALS_PATH` variable to point to your `credentials.json` file:

```bash
CREDENTIALS_PATH = 'config/credentials.json' # Update this path if necessary
```

- Replace `'YOUR_VIEW_ID'` in `app.rb` with your actual Google Analytics View ID.

### 5. Run the application
Start the Sinatra application with the following command:

```bash
ruby app.rb
```

### 6. Access the application
Open your web browser and navigate to:

```bash
http://localhost:4567
```

## Acknowledgments

[Sinatra](https://sinatrarb.com/) - The web framework used for this project.
[Google Analytics Reporting API] - The API used to fetch analytics data.