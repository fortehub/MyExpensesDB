# **MyExpensesDB**
<br/>

**Brief intro about the Stored Procedure**
----------------------------------------------------------------------------------------------------------------------------------
We create this stored procedure (usp_CutOffExpSav_param) to manually update the expenses and saving per cut-off/payday value. Here I wil show the capability of this stored procedure.
<br/>

**Executing the Stored Procedure**
----------------------------------------------------------------------------------------------------------------------------------
**Step 1** - Insert new record/s to Paidtbl table.  <br/>
Check first the last value of the Paidtbl table and PyExSvtbl table (see images below).
<br/>
<br/>
Last record for Paidtbl table:              <br/>
![image](https://user-images.githubusercontent.com/95063830/157241927-a3165485-f7b1-4a66-9681-700dd1e04868.png)
<br/>
<br/>
Last record for PyExSvtbl table. Some records are cannot be shown due to personal data privacy!  <br/>
<br/>
![image](https://user-images.githubusercontent.com/95063830/157241669-a44ddc82-013e-4ece-894f-49193a01524d.png)
<br/>
Take note of the SavAmount. That is the total Saving amount I have as of now for the pay day date of 02/24/2022. Now I will enter 1 record to the Paidtbl table <br/>
<br/>
![image](https://user-images.githubusercontent.com/95063830/157242294-a5e39d99-3f15-4ee8-aab9-0b4a965a3d25.png)
<br/>
<br/>
So in order for the new expenses to subtract from the SavAmount, we will executed the Stored Procedure.
<br/>
<br/>
**Step 2** - Open SQL Server Management Studio or Azure Data Studio <br/>
Execute the following statement below. Make sure to type the correct PayDay's Date.<br/>
<br/>

USE MyExpensesDB;         <br/>
GO                        <br/>

EXEC dbo.usp_CutOffExpSav_param '02/24/2022' --type the appropriate Pay Day Date here   <br/>
GO    <br/>
<br/>
<br/>
**Step 4** Verify the changes made by the Stored procedure  <br/>
Open the excel file, go to Devart section, then go to "PyExSvtbl" sheet. Click the "Refresh" and "OK" button to update the records on the excel file.
<br/>
![image](https://user-images.githubusercontent.com/95063830/157243772-8499aaa9-41ba-41e4-86fe-9793cbeacc72.png)
<br/>
![image](https://user-images.githubusercontent.com/95063830/157243824-0a3557f4-1415-4e7a-a79b-f69e1521bb32.png)
<br/>
<br/>
![image](https://user-images.githubusercontent.com/95063830/157244112-306d0261-48f4-44fb-8cb4-a60d40804f5b.png)
<br/>
A value of "30" was subtracted from the last SavAmount value. This is the effect of the stored procedure we've created.<br/>
<br/>

**Executing the Stored Procedure thru Batch file**
----------------------------------------------------------------------------------------------------------------------------------
But running this stored procedure on SSMS/Azure Studio is a little bit cumbersome. Not anymore, the solution is to create a PowerShell script for this stored procedure and create a batch file to run the PowerShell script. PowerShell Script and batch file also uploaded.
<br/>
<br/>
Here's the script of the PowerShell script to call the StoredProcedure:                                 <br/>

$SqlConnection = New-Object System.Data.SqlClient.SqlConnection                                         <br/>
$SqlConnection.ConnectionString = "Server=localhost;Database=MyExpensesDB;Integrated Security=True"     <br/>
$SqlCmd = New-Object System.Data.SqlClient.SqlCommand                                                   <br/>
$SQLCmd.CommandType = [System.Data.CommandType]::StoredProcedure                                        <br/>
$SqlCmd.CommandText = "dbo.usp_CutOffExpSav_param"                                                      <br/>
$param1=$sqlcmd.Parameters.Add("@NthPayDate", [System.Data.SqlDbType]::Date)                            <br/>
$PayDate = Read-Host "Please the input the Payday Date"                                                 <br/>
$param1.Value = $PayDate                                                                                <br/>
$SqlCmd.Connection = $SqlConnection                                                                     <br/>
$SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter                                           <br/>
$SqlAdapter.SelectCommand = $SqlCmd                                                                     <br/>
$DataSet = New-Object System.Data.DataSet                                                               <br/>
$SqlAdapter.Fill($DataSet)                                                                              <br/>
$SqlConnection.Close()                                                                                  <br/>
$DataSet.Tables[0]                                                                                      <br/>
<br/>
<br/>
**Step 1** - Save this file on your local folder.
<br/>
<br/>
![image](https://user-images.githubusercontent.com/95063830/157246098-3ef6c1df-1145-4507-bc2d-b453eb78538a.png)
<br/>
<br/>
**Step 2** - Create batch file to execute the PowerShell Script     <br/>
Here's the command to for this job. Please take path (file location) of the folder where you save the PowerShell Script. This batch file must be save on the same file location. The path of the PowerShell Script will be input on this batch file (example: D:\OneDrive\MyExpenses\Exec_usp_CutOffExpSav_param.ps1)
<br/>
<br/>
@echo off                                                 <br/>
echo Calling a Stored Procedure.......                    <br/>

Powershell.exe -ExecutionPolicy Bypass -Command "& 'D:\OneDrive\MyExpenses\Exec_usp_CutOffExpSav_param.ps1'" >"D:\OneDrive\MyExpenses\Exec_usp_CutOffExpSav_param.log"  <br/>
<br/>
echo Calling a Stored Procedure Completed.......... <br/>
pause <br/>
<br/>
<br/>
Save the batch as .BAT file.
<br/>
<br/>
![image](https://user-images.githubusercontent.com/95063830/157247036-c70767c2-e6f1-4a80-af8f-f3fa13df3e84.png)
<br/>
<br/>
**Step 3** - Insert records again to Paidtbl and running the batch file.<br/>
Take note of the last records of Paidtbl and PyExSvtbl table (see images below).
<br/>
<br/>
![image](https://user-images.githubusercontent.com/95063830/157247392-1f4b60ee-8703-4b45-9fe9-05fd9a274d17.png)
<br/>
![image](https://user-images.githubusercontent.com/95063830/157244112-306d0261-48f4-44fb-8cb4-a60d40804f5b.png)
<br/>
<br/>
Inserting new record. Commit after inserting.
<br/>
<br/>
![image](https://user-images.githubusercontent.com/95063830/157247728-58f00976-9bc8-48e9-9aaf-d76cc8937f0f.png)
<br/>
<br/>
Locate the batch file we've created before. Double-click to run!
<br/>
<br/>
![image](https://user-images.githubusercontent.com/95063830/157248048-54d3dda3-c79d-49f0-8347-c0c79fe2fde0.png)
<br/>
<br/>
Fill up the correct & appropriate Payday's Date and press after ENTER!
<br/>
<br/>
![image](https://user-images.githubusercontent.com/95063830/157248315-3db5e03d-35fa-463f-aea2-268bf574aa04.png)
<br/>
![image](https://user-images.githubusercontent.com/95063830/157248403-ba63267c-a6d5-4095-a55f-76f70e31c295.png)
<br/>
<br/>
Now go to the excel file again. Hover to Devart Section & PyExSvtbl sheet and click the "Refresh" button. 
<br/>
![image](https://user-images.githubusercontent.com/95063830/157248643-27e447a7-f849-4c2e-96fd-2c9477c579e7.png)
<br/>
You'll see that a value of "32" has been subtracted from the last SavAmount.
<br/>
<br/>
**Next Stage**
-----------------------------------------------------------------------------------------------------------------------------------
Proceed to "BI Reporting.md" file.
https://github.com/fortehub/MyExpensesDB/blob/main/BI%20Reporting.md

