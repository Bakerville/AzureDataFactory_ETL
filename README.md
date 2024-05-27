# ETL WITH DATA FACTORY

This is my personal project for learning data warehouse architecture and Azure Cloud Platform. Incidentally, I had this data from a colleague. Then, I thought that I could use these data to take a hand-on project to get more knowledge on how to operate a data system

**1. REQUIREMENTS**

There is a data of student in a college (so, i set up private for this repository). I need to load these data into a server for long-term storing and support analysis automaticly.

In this project, it requires modeling following snowflake schema. When you slice data along SchoolYear dimension, Faculty dimension, the dashboard will show you the infomation and marks of a student.

<img title="a title" alt="Alt text" src="/images/Data Processing.png">


**2. What I will do in this project?**

My system follows 3-layers architecture, which includes 3 data layers: **Staging**, **Data Warehouse**, **Data Mart**. Data from raw datastore is extracted, loaded and tranforms through layers. In each layer, data is stored in differenct types with different schemas.

In the beginning of data processing, I faced to a problem. The data in each files is missed 3 attribute faculty, schoolyear and class name. These two attributes are include in the file path **/faculty/school_year/class_name.csv/**. When loading data from raw to staging, I have to extract these information and add them as 3 derived column.

<img title="adf" alt="Alt text" src="/images/Raw Data Directory.png">

<p>
        <em style="text-align: center;">The directory of each files in raw data</em>
</p>

<img title="adf" alt="Alt text" src="/images/Schema in raw.png">

<p>
        <em style="text-align: center;">Schema of Raw Files</em>
</p>

<img title="adf" alt="Alt text" src="/images/Schema in Datalaek.png">

<p>
        <em style="text-align: center;">Schema of Files in Staging after ETL</em>
</p>

<img title="adf" alt="Alt text" src="/images/Dataflow_Raw_to_Staging.png">

<p>
        <em style="text-align: center;">Dataflow ETL from Raw to Staging</em>
</p>

**The second step** is ETL from Staging to Datawarehouse (Azure SQL Server). The design of data warehouse follows snowflake schema

<img title="adf" alt="Alt text" src="/images/DW diagram.jpg">
<p>
        <em style="text-align: center;">Data Modeling</em>
</p>

The data is tranformed and loaded following the order: subdim -> dim -> fact. The fact is the mark of all students.

<img title="adf" alt="Alt text" src="/images/Data Flow ETL from Staging to dim_sinhvien.png">
<p>
        <em style="text-align: center;">Data Flow ETL from Staging to SinhVien Dimension</em>
</p>

Last step of entire processing, Data from Azure SQLserver is loaded to Power BI. I wrote some DAX measure to display all data.

<img title="adf" alt="Alt text" src="/images/Dashboard for Information.png">
<p>
        <em style="text-align: center;">Information dashboard</em>
</p>

<img title="adf" alt="Alt text" src="/images/Slicers.png">


There are 2 mode to see data: Letter mode and Number mode made of a DAX measure

<img title="adf" alt="Alt text" src="/images/Letter Mark.png">
<p>
        <em style="text-align: center;">Mark Dashboard in Letter Mode</em>
</p>

<img title="adf" alt="Alt text" src="/images/Number Mark.png">
<p>
        <em style="text-align: center;">Mark Dashboard in Number Mode</em>
</p>

**3. What I have learned?**

When the data produced in business processes grows promptly day by day, Data Warehouse Architecture is essential to reduce the size of storage. Appently, The data warehouse that operatios data in many dimensions and facts provides fast query.

In data warehouse, the surrogate key (I used INDENTITY(1,1) for this key in database) is used as foreign keys instead of natural key. I think the reason that when you quries data, The tables will be joint and filter with conditions, using surrogate key as integer gives fast operation than nature key (string type). 












