# Installation of Burglary Optimization

## The idea
...

## Data sources used
...

## Dependencies
Please install java (www.oracle.com) and gradle (https://gradle.org/install/) to begin with.
For deployment ml-gradle (https://github.com/marklogic-community/ml-gradle) is being used.

## Configuration on your machine
By default the application assumes a MarkLogic server on localhost with username 'admin' and password 'admin'.
It deploys a REST endpoint on port 8061 and an ODBC endpoint on 8062.
If you need to change any of this, change the settings in 'gradle.properties'

## What it does
This application consists of two parts:
1. A visualization that uses TDE to create SQL views that can be used by a BI tool. The reason for this is to allow IT staff without MarkLogic experience, but with SQL experience, to still make value of the data.
2. The second part leverages the Slush application in order to create a search/find front-end enabling users to drill down using facets.

## Deploy the database
` gradle mlDeploy

## Ingest the data
` gradle importHoliday
` gradle importWeather
` gradle importMoonlight
` gradle importBurglary

## Some usefull administrative commands
If you want to redeploy the TDE's, run ` gradle mlLoadSchemas
If you want to clean the full dataabase, run ` gradle mlClearContentDatabase -PdeleteAll=true
