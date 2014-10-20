
<!--- Create query set --->
<cfquery name="city_info" datasource="anthony_test" >
  SELECT city, state, area
  FROM cf
</cfquery>

<!--- Contents of table
"dallas"      "tx"  214
"fort worth"  "tx"  817
"san antonio" "tx"  210
"L.A."        "ca"  213
"seattle"     "wa"  206
--->

<!--- Create 2-D Array --->
<cfset CityInfo=ArrayNew(2)>

<!--- Add data from query set to array --->
<cfloop query="city_info"> 
  <cfset CityInfo[CurrentRow][1]=city> 
  <cfset CityInfo[CurrentRow][2]=state> 
  <cfset CityInfo[CurrentRow][3]=area> 
</cfloop> 

<!--- Switch 'L.A.' to 'Los Angeles' --->
<cfset CityInfo[4][1] = "Los Angeles">

<!--- Append new city --->
<cfset newCity = ["Irving", "tx", 972]>
<cfset ArrayAppend(CityInfo, newCity)>

<!--- Loop over the array and output contents of table. Append '!' to cities that contain the letter 's' --->
<table>
  <tr>
    <td>City</td>
    <td>State</td> 
    <td>Area Code</td>
  </tr>

  <cfset total_records=city_info.recordcount> 
  <cfloop array="#CityInfo#" index="i">
    <cfoutput> 
      <!--- Append '!' to cities that contain the letter 's'
     --->
      <cfif FindNoCase('s', #i[1]#) eq 0>
        <cfset current_city = #i[1]#>
      <cfelse>
        <cfset current_city = #i[1]# & "!">
      </cfif>

      <tr>
        <td>#current_city#</td>
        <td>#i[2]#</td> 
        <td>#i[3]#</td>
      </tr>
    </cfoutput> 
  </cfloop>
</table>