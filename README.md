# World-GDP-Estimates
A Modern Data Stack project with the aim of building and configuring a data pipeline that ingest data from source to destination,  create version controlled transformations, testing, deployment, documentation and delivering insights.

This is the second side-project that I am using to solidify my understanding of the Modern Data Stack and the Analytics Engineering Space.

My first attempt at an analytics engineering can be found here[https://github.com/olatkem2/YML-Fashion-Hub---dbt-project] where I used the Fashion Industry as a case study and tried to hone my skills[Docker, Airbyte, BigQuery, dbt, Git, Metabase] at a basic level.
If you need help on this tools, you can check out the link above.

In this project, I will be trying to play around using both Google sheets and Postgres as my data source at different stage of the pipeline. This may not be so applicable in real life, It was necessary to try it out for future use. 
Even though this is an Analytics Engineering project, I will use Tableau as my preferred BI Tool here just because I feel it will better bring my data to life and it shines with Map visuals which I will be using here.

Gross domestic product (GDP) is the market value of all final goods and services from a nation in a given year. Countries are sorted by nominal GDP estimates from financial and statistical institutions, which are calculated at market or government official exchange rates. 
Nominal GDP does not take into account differences in the cost of living in different countries, and the results can vary greatly from one year to another based on fluctuations in the exchange rates of the country's currency. Such fluctuations may change a country's 
ranking from one year to the next, even though they often make little or no difference in the standard of living of its population.

Comparisons of national wealth are also frequently made on the basis of purchasing power parity (PPP), to adjust for differences in the cost of living in different countries. Other metrics, nominal GDP per capita and a corresponding GDP (PPP) per capita are used for 
comparing national standard of living. On the whole, PPP per capita figures are less spread than nominal GDP per capita.

This is a somewhat basic to intermediate project. Fell free to follow along.

## Tools 

1. Docker: This is the local version container that will house our Airbyte's Extract and Load solutions/App.
2. Airbyte: The Open source version that we will use to extract and load data from source to destination.
3. Google Sheets: This is our Data source which is also scrapped data from the web.
4. PG Admin and Postgres: This will serve as an intermediate source to our destination.
5. Big Query: This is our Data warehouse and Destination .
6. dbt Cloud: This is our development, test, deployment, documentation, transformation, modelling and scheduling tool for our models.
7. Git and Github: This is our version control tool to enable collaboration and seamless CI[continuous Integration].
8. VS Code: This is our Integrated Development Environment, IDE where we can easily make changes to a cloned branch of our project,commit and merge.
9. Tableau: This is our Business Intelligence Layer to tell story in digestible form coming as insights.

I will not cover the installation and config steps for the listed tools as I have already done so in my previous project, click the link above.

## Workflow and Though-process

This is very simple. I will extract World GDP data from Wikipedia into google sheets, load into a staging layer in my local posgtres instance and load from postgres to my final destination, BigQuery.
dbt will fetch the data from my data warehouse(i.e BigQuery) will develop, test, document, deploy and schedule custom models and well curated data.
Tableau will then connect BigQuery using the transformed datasets provided by dbt to generate insights.

The idea is that we have each tool doing what they know how to do best. Not bugging the BI Tool with heavy transformation and doing as much transformation 
that can be done at the source. Also the ability to build in test at the source and model level, not forgetting incorporating documentation while all these is happening. 
This is truly bananas.

## steps
1. 

