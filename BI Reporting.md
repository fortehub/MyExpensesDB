# **MyExpensesDB**
<br/>

**BI Reporting**
------------------------------------------------------------------------------------------------------------------------------------
Here's a sample of BI Reporting from the Database. I want to create a report based on how much I spent per category and payday date.

![image](https://user-images.githubusercontent.com/95063830/157369225-37bdece1-fcb1-46f7-a579-8ecc5e4db5cb.png)
<br/>
<br/>
To achieve this, you need to install Power BI Desktop (https://www.microsoft.com/en-us/download/details.aspx?id=58494)
<br/>
<br/>

**Connecting to Database and Creating Report**
------------------------------------------------------------------------------------------------------------------------------------

**Step 1** - After the installation, open PowerBI Desktop, then click "Import data from SQL Server"
<br/>
![image](https://user-images.githubusercontent.com/95063830/157388605-c2f53e61-10b6-4905-a81b-c2929d6b5d4c.png)
<br/>
<br/>
Fill up the following. Follow the image below. We will query the VIEW that we've created before, but with WHERE Clause to filter records that I only want. 
<br/>
Then click OK to proceed.
<br/>
![image](https://user-images.githubusercontent.com/95063830/157392349-431d3620-a81b-46d1-82be-c148c22bcba1.png))
<br/>
<br/>
Click the LOAD button.
<br/>
![image](https://user-images.githubusercontent.com/95063830/157392584-aa94d44f-e93d-42da-a9f0-74f387b5cbc4.png)
<br/>
<br/>
A query entry will appear on the Field Section (right side of the application).
<br/>
![image](https://user-images.githubusercontent.com/95063830/157389216-5eedc29b-ca9c-430f-b6c5-7b928b9148d1.png)
<br/>
<br/>
**Step 2** - Select PIE or Donut Char on the Visualization section or depends on what you need.
<br/>
<br/>
![image](https://user-images.githubusercontent.com/95063830/157389536-e5901ca2-3226-4914-aa57-da14db2ce35d.png)
<br/>
<br/>
Click anywhere on the white page, then select Matrix on the Visualization section for the 2nd chart. Now we have 2 blank chart ready to setup.
<br/>
![image](https://user-images.githubusercontent.com/95063830/157389850-aefad021-9cf6-495d-a6ff-2fcb7a461cea.png)
<br/>
<br/>
Select/Click the Matrix chart. Go the Field section, and check the following based on the image below
<br/>
![image](https://user-images.githubusercontent.com/95063830/157391202-c537f64b-bb11-41d9-b5d4-09de2ead5274.png)
<br/>
<br/>
On the Visualization section. For the entries for (Rows, Column, Values), follow the image below
<br/>
![image](https://user-images.githubusercontent.com/95063830/157392817-32facbae-7407-49e6-8a41-a314e6e6fdcc.png)
<br/>
<br/>
Back to the matrix chart. It will be filled up with data now. Now you can view the amount of expenses you have based on the Category and PayDay's Date.
<br/>
![image](https://user-images.githubusercontent.com/95063830/157393291-0a6302ad-5d9c-4616-9e28-45ada8a724a9.png)
<br/>
<br/>
Back on the Pie chart. Click the Pie Chart. Go to the Field Section and check the following based on the image below.
<br/>
![image](https://user-images.githubusercontent.com/95063830/157393677-b050eff6-981e-44e3-9e70-29bcc08743c7.png)
<br/>
<br/>
Now you can view which Category has highest or lowest value. 
<br/>
![image](https://user-images.githubusercontent.com/95063830/157393777-54464dcb-1f22-443e-9859-2fbaa546e069.png)
<br/>
<br/>
Create 3rd chart. Select Area Chart on the Visualization field.
<br/>
![image](https://user-images.githubusercontent.com/95063830/157394695-6eb774ec-11ea-47ef-b36b-44fe8ba139cd.png)
<br/>
<br/>
This is the Final view.
<br/>
![image](https://user-images.githubusercontent.com/95063830/157394863-bb86dd01-1cca-489b-937f-abcc59f794da.png)
<br/>
<br/>
You can add text box to give more information. Like this one.
<br/>
![image](https://user-images.githubusercontent.com/95063830/157395032-1394e9a1-9443-460b-96c6-27b46ffe0e99.png)
<br/>
<br/>
Give name to the Page.
<br/>
![image](https://user-images.githubusercontent.com/95063830/157395155-4da7c16a-868e-424f-8776-79e46c05e094.png)
<br/>
<br/>
Also this one.
<br/>
![image](https://user-images.githubusercontent.com/95063830/157395253-b9f892e7-a1a3-4e0d-a5f4-52492dab888f.png)
<br/>
<br/>
**Step 3** - Save the current report.<br/>
Click File button at the upper left.
.<br/>
![image](https://user-images.githubusercontent.com/95063830/157395489-b34e0d89-185e-4fd2-8315-ae10c731e3f5.png)
<br/>
<br/>
Click Save.
.<br/>
![image](https://user-images.githubusercontent.com/95063830/157395561-3dc47e17-dc79-4beb-ad6d-e37239bc993f.png)
<br/>
<br/>
And save it on your preferred destination.
<br/>
![image](https://user-images.githubusercontent.com/95063830/157395658-8f483516-30fe-449b-9c35-7679a8620703.png)
<br/>
<br/>
BI Report also upload. File name "Everyday Expenses"





