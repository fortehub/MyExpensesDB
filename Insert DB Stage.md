# **MyExpensesDB**
<br/>

**Database Objects Creation**
----------------------------------------------------------------------------------------------------------------------------------
We will now going to insert records to the database. Instead of inserting manually the records, I'll use excel app with Devart Add-ins installed.

![image](https://user-images.githubusercontent.com/95063830/157231296-3d1f0c47-daa0-4053-831e-51009b05d6a2.png)
<br/>
<br/>

**Step 1** - Connect to the database. <br/>
To connect, click the "Get Data Button". A "Set up data conneciton properties" window will appear to setup your database connection.

![image](https://user-images.githubusercontent.com/95063830/157231732-a0ec0efa-499f-4377-ace0-1cf8233ad26a.png)
<br/>
<br/>

**Step 2** - Fill up the necessary entries. Then Click the Next button to proceed.    <br/>
**Host** - IP or Computer Name<br/>
**Database** - Name of the database you want to connect                               <br/>

![image](https://user-images.githubusercontent.com/95063830/157232327-7182eeb2-d33d-42fd-9798-8fc642dc7f9d.png)
<br/>
<br/>

**Step 3** - At the "Import Data Wizard" window, select the object you want connect. Here I will connect to the three tables we have created before. I will make 1 sheet per table. Then click the finish button

![image](https://user-images.githubusercontent.com/95063830/157232702-f9115660-be41-43c4-aaa4-0c235f13e75c.png)
<br/>
![image](https://user-images.githubusercontent.com/95063830/157232821-0657f2e5-16d8-46b8-8dfb-2812d82c878f.png)
<br/>
![image](https://user-images.githubusercontent.com/95063830/157232930-12199f4a-99a0-43c5-9629-a2b2c3a60866.png)
<br/>

Done! Now do this to the other tables. Save the excel file after <br/>
![image](https://user-images.githubusercontent.com/95063830/157233135-4c452835-4ace-455a-a7a4-4363d9c6385c.png)
<br/>
<br/>
Now we are ready to insert some records.
<br/>
<br/>
**Step 4** - Insert some records to PyExSvtbl table. This is the first table that need to have the records inserted first because you will not be able to enter records in Paidtbl table because of Foreign Key Constraints. Click first the "Edit Mode" button then click Yes to proceed. <br/>

![image](https://user-images.githubusercontent.com/95063830/157234394-6b7d612f-672e-46c6-8a43-e2f808a954b6.png)
<br/>
Now we can insert the appropriate records for this table which are my (Pay day date, Cut-off/Pay Day Salary, Cut-off/Pay Day Expenses and Savings). I will only show a little portion of the records since it's my Personal Data. Don't be surprise!, I have a low income/salary from my previous job, compare now. 
<br/>
![image](https://user-images.githubusercontent.com/95063830/157234960-b3bf3528-9530-4a2c-8a0a-7bca3f11489a.png)
<br/>

After inserting the records, click the "Commit" & "OK" button. Don't forget to save the excel file for each update we make.  <br/>
![image](https://user-images.githubusercontent.com/95063830/157235336-fcf256df-0b59-4d59-a921-37707c9eee1e.png)
<br/>
![image](https://user-images.githubusercontent.com/95063830/157236260-f4453146-13c7-4206-98cd-5084df406872.png)
<br/>
<br/>
**Step 5** - Verify if the records really inserted to the database. Run the following SQL statement below.
<br/>
<br/>
Select count(*) from dbo.PyExSvtbl

![image](https://user-images.githubusercontent.com/95063830/157235783-104da3ed-f5f0-4d6b-92d7-54d1ae9d61dc.png)
<br/>
As we can see, the table has 29 new inserted records.
<br/>
<br/>
**Step 6** - Insert records to the remaining table.   <br/>
I have inserted records to Paidtbl table              <br/>
<br/>
![image](https://user-images.githubusercontent.com/95063830/157236609-1882793a-1bb3-4939-ab98-02f7a1cc52f4.png)
<br/>
<br/>
**Step 7** - Verify if the records really inserted to the database. Run the following SQL statement below.
<br/>
<br/>
SELECT COUNT(*) FROM dbo.Paidtbl

![image](https://user-images.githubusercontent.com/95063830/157236986-95cad117-8623-4cda-957e-cd926af5e55c.png)
<br/>
<br/>
SELECT COUNT(*) FROM dbo.FrmDepotbl

![image](https://user-images.githubusercontent.com/95063830/157238238-9c65728c-d045-4f71-b260-5da5e3cc6b88.png)
<br/>
<br/>

Note: Uploaded sample data (Insert DB Stage Sample data.xlsx)


**Next Stage**
-----------------------------------------------------------------------------------------------------------------------------------
Proceed to "Execute Procedure.md" for the database creation procedures
