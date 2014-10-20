PROJECT:

Create a query set from scratch that holds five city names, the state the city is located in and a telephone area code from this city.

Example:
row1: 'dallas', 'tx', '214'
row2: 'fort worth', 'tx', '817'
row3: 'san antonio', 'tx', '210'
row4: 'L.A.', 'ca', '213'
row5: 'Austin', 'tx', '512'


This can be accomplished by building the query set from scratch or by making a csv and calling it in. Look up the Query functions in coldfusion live documentation. 
OR
To use a csv look up the cffile and cfquery tags in coldfusion documentation and google how to use them together to query a csv file.


Once you have built the query set run a query against it to retrieve the results. Add the data into a two diminsional array. Example of the array:

CityInfo[1][1] = 'dallas'
CityInfo[1][2] = 'tx'
CityInfo[1][3] = '214'
CityInfo[2][1] = 'fort worth'
CityInfo[2][2] = '817'
CityInfo[2][3] = 'tx'
CityInfo[3][1] = 'san antonio'
CityInfo[3][2] = 'tx'
CityInfo[3][3] = '210'
CityInfo[4][1] = 'L.A.'
CityInfo[4][2] = 'ca'
CityInfo[4][3] = '213'
CityInfo[5][1] = 'Austin'
CityInfo[5][2] = 'tx'
CityInfo[5][3] = '512'

With the array added now switch the value 'L.A' to 'Los Angeles' in the array. Now append a new city to the array. Info to be appended:

CityInfo[5][1] = 'Irving'
CityInfo[5][2] = 'tx'
CityInfo[5][3] = '972'

now loop over the array and build a report/table that will display the cities on the page. When looping over this, on each loop iteration check the value of the city, if it CONTAINS the 
character 's' display a '!' right at the end of the city name.

Example

dallas!        tx    214
fort woth    tx    817
san antonio!    tx      210
Los Angeles!    ca    213
Austin!        tx    512
Irving        tx    972