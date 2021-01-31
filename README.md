# Final Project
Use this `REAMDE.md` file to describe your final project (as detailed on Canvas).

# Domain of Interest

## Food Assistance and Nutrition in the United States

**Why are you interested in this field/domain?**

Our team is interested in exploring food insecurity to better understand the social factors influencing unequal access to nutritious foods in the United States. We strive to do this by examining correlations between factors such as socioeconomic status, geographic location, education, and ethnicity. Additionally, our team is curious about the success of food assistance programs across the US. Because the implementation of the Supplemental Nutrition Assistance Program (SNAP) leaves room for state interpretation, the quality of accessible food through SNAP varies by state. We are interested in learning if the overall goal of providing access to nutritious foods is being met.

**What other examples of data driven project have you found related to this domain?**

**1. Washington Food Distribution** ([link](https://nras.maps.arcgis.com/apps/webappviewer/index.html?id=b1ad1be260fe4ef8b877fc7064b0649f))

This ArcGIS map of Washington depicts the geographical distribution of all WA food assistance establishments, from food banks to tribal organizations. Each point on the map also provides contact, locational, and miscellaneous information about the establishment it represents.

**2. Washington State Food Security Survey** ([Study measures food insecurity in Washington families - WSU Insider](https://news.wsu.edu/2020/11/19/wsu-helping-washington-families-facing-food-insecurity/))

A joint study conducted by UW, WSU, and Tacoma Community College. This joint team, called WAFOOD Survey Team, conducted the first-of-its-kind state-wide survey about food insecurity in Washington, finding that 30% of WA households have experienced food insecurity ever since the stay-at-home order has been  implemented due to Covid-19 pandemic.

**[3. Northwest Harvest's Interactive Maps of Food Insecurity in Washington State](https://www.livestories.com/statistics/hunger-in-washington/washington/food-insecurity)**

Northwest Harvest is a nonprofit focused on supporting food banks in Washington state; their aim is to promote having access to nutritious food as a human right. Because of this, Northwest Harvest utilized public data to communicate the issue of food insecurity in Washington State. Their visualization shows data on the number of residents who are food insecure, have low access to grocery stores, and are receiving food assistance through Basic Foods (also known as SNAPs).

**[4. Fruit and Vegetable Incentive Program](https://www.doh.wa.gov/ForPublicHealthandHealthcareProviders/PublicHealthSystemResourcesandServices/Funding/FruitandVegetableIncentivesProgram)**

To incentivize nutritious eating, Washington State implemented a fruit and vegetable incentive program. With financial support from the U.S. Department of Agriculture, SNAP users receive extra resources to spend on produce. These benefits apply to grocery stores and farmers markets state-wide.  



**What data-driven questions do you hope to answer about this domain?**

  - Are certain geographical areas more prone to food insecurity/inequality?
  - Are there correlations between demographics and distance which affect access to food assistance?
  - How do demographics affect the _quality_ of food assistance (freshness, nutrition content, price, eligibility).
  - Is SNAPs goal of enabling families to purchase healthy food successful?


## Finding Data

- Where did you download the data (e.g., a web URL)?
- How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
- How many observations (rows) are in your data?
- How many features (columns) are in the data?
- What questions (from above) can be answered using the data in this dataset?

## 1. **Source:** [Economic Research Service, U.S. Department of Agriculture](https://www.ers.usda.gov/topics/food-nutrition-assistance/food-security-in-the-us/interactive-charts-and-highlights)

**Data Collection Method:** This file contains five tabs with statistics on food security in the United States calculated by USDA's Economic Research Service (ERS). The data source for these statistics is the Current Population Survey Food Security Supplement (CPS-FSS) from the U.S. Census Bureau and sponsored by ERS.

**Number of Observations:** Anywhere between 40+ to 500+ observations on each of the 5 tabs.

**Number of Features:** Around 10 features per each tab

**Questions that could be answered:** How many children were in a food insecure household in a given year, and how has it changed over time? What proportion of food insecure households have children?


## 2. **Source:** [Food Environment Atlas 2018, U.S. Department of Agriculture](https://www.kaggle.com/carrie1/food-environment-atlas )

**Data Collection Method:** This data was generated by The United States Department of Agriculture and downloaded from Kaggle, a data science community. This file contains nine tabs concerning the relationship between access to healthy food and various demographic factors. The Food Environment Atlas helps inform researchers who then inform policymakers about healthy food initiatives.

**Number of Observations:** There are 3,100+ observations in the access tab, and there is an additional eight tabs.

**Number of Features:** There are around 362 features in total between nine tabs.

**Questions that could be answered:** Whether certain geographical areas are more prone to food insecurity. Whether there are correlations between demographics and distance which affect access to food assistance. How demographics affect the quality of food assistance (freshness, nutrition content, price, eligibility).


## 3. **Source:** [Feeding America](https://map.feedingamerica.org)

I downloaded this data from Feeding America, a nonprofit organization with a network of over 200 foodbanks. Each year Feeding America releases comprehensive study that helps understand “food insecurity and food costs at the local level” across the United States.

**Data Collection Method:** This data provides information about what food insecurity looks like in the United States. The map shows estimated food assistance eligibility among those that are insecure per state and county. Additionally, their map shows an estimate of how much money is still needed to meet the food needs of those who are food insecure.

The data was collected through two types of community-level data:

1.  Local food insecurity estimates by income category for all individuals and children

2. Local food expenditure estimates, both among those who are food secure and food insecure  

Feeding America conducted their own research drawing data from Current Population Survey (CPS), the American Community Survey (ACS), and the Bureau of Labor Statistics (BLS). Detailed descriptions of their methodology and a technical appendix can be found in their [technical brief document](https://www.feedingamerica.org/sites/default/files/2020-09/Map%20the%20Meal%20Gap%202020%20Technical%20Brief-Updated.pdf).

_The data is in a folder comprised of 10 excel documents, each with information about a specific year; it ranges from 2009 to 2018.  Each yearly document contains 3 tabs, which lists food insecurity at the county, congressional district, and state levels._

**Number of Observations (in 2018):**
 - County: 3144 observations
 - Congressional District: 438 observations
 - State: 50 observations

**Number of Features (in 2018)**
- County: 18 features
- Congressional District: 16 features
- State: 18 features

**Questions that could be answered:** Questions regarding which regions of the United States are most food insecure and which specific counties are struggling can be answered. This data set can also provide information about the budget shortfalls, where one can answer the question of how much money is needed to ensure that those who are food insecure are fed. Because it gives a yearly report, one can provide answers for how food insecurity in the United States has changed over time.

## 4. **Source:** [US Public Food Assistance](https://www.kaggle.com/jpmiller/publicassistance)
**Source:** Kaggle, an online data science and machine learning community.

**Data Collection Method:** US Census Bureau, US Dept of Agriculture: Data was downloaded in Excel format directly from [US government agency web sites](https://www.fns.usda.gov/pd/supplemental-nutrition-assistance-program-snap). No further information.

**Number of Observations:** 51

**Number of Features:** 6

**Questions that could be answered:**
- In what year was `average participation` highest?
- What about `total benefits`?
- What is the ratio of `total benefits` to `total costs` in the past 10 years?
