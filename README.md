
![project banner](https://github.com/olatkem2/World-GDP-Estimates/blob/dev/images/World%20GDP%20Estimates%20Modern%20Data%20Stack%20image.JPG)

# World-GDP-Estimates
A Modern Data Stack project with the aim of building and configuring a data pipeline that ingest data from source to destination,  create version controlled transformations, testing, deployment, documentation and delivering insights.

This is the second side-project that I am using to solidify my understanding of the Modern Data Stack and the Analytics Engineering Space.

My first attempt at an analytics engineering can be found [YML Fashion Hub](https://github.com/olatkem2/YML-Fashion-Hub---dbt-project) where I used the Fashion Industry as a case study and tried to hone my skills (Docker, Airbyte, BigQuery, dbt, Git, Metabase) at a basic level.
If you need help on this tools, you can check out the link above.

In this project, I will be trying to play around using both Google sheets and Postgres as my data source at different stage of the pipeline. This may not be so applicable in real life, It was necessary to try it out for future use. 
Even though this is an Analytics Engineering project, I will use Tableau as my preferred BI Tool here just because I feel it will better bring my data to life and it shines with Map visuals which I will be using here.

Gross domestic product (GDP) is the market value of all final goods and services from a nation in a given year. Countries are sorted by nominal GDP estimates from financial and statistical institutions, which are calculated at market or government official exchange rates. 
Nominal GDP does not take into account differences in the cost of living in different countries, and the results can vary greatly from one year to another based on fluctuations in the exchange rates of the country's currency. Such fluctuations may change a country's 
ranking from one year to the next, even though they often make little or no difference in the standard of living of its population.

Comparisons of national wealth are also frequently made on the basis of purchasing power parity (PPP), to adjust for differences in the cost of living in different countries. Other metrics, nominal GDP per capita and a corresponding GDP (PPP) per capita are used for 
comparing national standard of living. On the whole, PPP per capita figures are less spread than nominal GDP per capita.

This is a somewhat basic to intermediate project. Fell free to follow along.

## Data Source

Wikipedia - [List of Countries by GDP(Nominal)](https://en.wikipedia.org/wiki/List_of_countries_by_GDP_(nominal))
Gross domestic product (GDP) is a monetary measure of the market value of all the final goods and services produced and sold (not resold) in a specific time period
by countries.

## Tools 

1. Docker: This is the local version container that will house our Airbyte's Extract and Load solutions/App.
2. Airbyte: The Open source version that we will use to extract and load data from source to destination.
3. Google Sheets: This is our Data source which is also scrapped data from the web.
4. PG Admin and Postgres: This will serve as an intermediate source to our destination.
5. Big Query: This is our Data warehouse and Destination .
6. dbt Cloud: This is our development, test, deployment, documentation, transformation, modelling and scheduling tool for our models.
7. Git and Github: This is our version control tool to enable collaboration and seamless CI[continuous Integration].
8. VS Code: This is our Integrated Development Environment, IDE where we can easily make changes to a cloned branch of our project,commit and merge.
9. Power BI: This is our Business Intelligence Layer to tell story in digestible form coming as insights.

I will not cover the installation and config steps for the listed tools as I have already done so in my previous project, click the link above.

## Workflow and Thought-process

This is very simple. I will extract World GDP data from Wikipedia into google sheets, load into a staging layer in my local posgtres instance and load from postgres to my final destination, BigQuery.
dbt will fetch the data from my data warehouse(i.e BigQuery) will develop, test, document, deploy and schedule custom models and well curated data.
Power BI will then connect to BigQuery using the transformed datasets provided by dbt to generate insights.

The idea is that we have each tool doing what it does best. Not bugging the BI Tool with heavy transformation and doing as much transformation 
that can be done at the source. Also the ability to build in tests at the source and model level, not forgetting incorporating documentation while all these is happening. 
This is truly bananas.

## steps

## A. Google Sheets - Data Source

1. Create a new workbook in Google sheets
2. Navigate to a new blank sheet and insert this fornula - IMPORTHTML("https://en.wikipedia.org/wiki/List_of_countries_by_GDP_(nominal)","Table",3)
    Read more about Google's Import Functions [Here](https://support.google.com/docs/answer/3093339?hl=en&ref_topic=9199554)
3. Open another blank sheet, Use the equal (=) sign and link it to the previous sheet to achieve a form of "First row as Header" type transformation.
4. Open yet another sheet and insert this formula -  ARRAYFORMULA(SPLIT(FLATTEN(countries_gdp_semi_cleansed!F1:H1 & "," & countries_gdp_semi_cleansed!A2:A217 & "," & countries_gdp_semi_cleansed!B2:B217 & "," & countries_gdp_semi_cleansed!F2:H217), ","))
    Read more about [FLATTEN](https://support.google.com/docs/answer/10307761?hl=en), [SLPIT](https://support.google.com/docs/answer/3094136?hl=en) and [ARRAYFORMULA](https://support.google.com/docs/answer/3093275?hl=en)
 Our goal for the first four steps is to have our data in columnar format, with final 4 columns like; Estimate type, Country, Region and GDP.

## B. Airbyte - Data Loader(EL Tool)

5. Create two connections in Airbyte. 
    a. To extract and load data from google sheets to Postgres. 
        - Create a service account information in json format which can be gotten by creating a Google Workspace account.
        - get the url of the google sheets and share it with the newly created google workspace account.
        - Create a database in postgres and get the host, port, schema(default is public), username and password.
    b. To extract and load from Postgres to BigQuery. 
        - You will make use of the first two information in the previous steps as regards postgres BUT as used as a source now.
        - Create a project in BigQuerywhich will service as our Database name. Create a Dataset, this will be our Schema.
        - Generate the service account information for the newly created project in json format and paste in the required field.
6. You can set the a custom schedule for both jobs to run. Remember if its running locally on your desktop/Docker, your docker must be up and running.

## C. dbt - Developing, Transorming, Modelling, Testing, Deploying, documenting

7. Create a new project and name it appropraitely.
8. Use the previously generated service account information as required.
9. Create a blank repository in Github and link to dbt BUT if you want dbt to manage it for you, click manage repository.
10. Determine and map out the folder/directory naming convention and files naming convention.
11. Start building your source files in yml file format in your models directory on a subfolder by subfolder basis i.e staging/stg_world_gdp_estimates.sql
12. Determine the Data Modelling Methodology. Basic data cleansing and transformations were perfomred here
13. Work on the dbt project file to choose what dbt will materialize as view or table. Usually model files in mart are materialized as tables and staging as as views
14. Create yml file for sub-folders in staging to cature documentation and the generic tests.
15. Create singular tests for additional layer of testing.
16. Create a production environment and create custom jobs to run your dbt models or at the folder level.

## D. Github - CI/CD and Collaboration

17. Use Github for CI/CD and for better collaboration which you can achieve on github or VS Code

## E. Power BI - Dashboarding(insights)






