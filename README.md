# <div align="center">WebMainApp Project</div>

Web App Visual Studio C# ASP.NET With Microsoft SQL 

A Project Assignment 
Created By George Mitsis

### <div align="center">Setup</div>

---

#### Visual Studio Installation Requirements

- Install [**Visual Studio**](https://visualstudio.microsoft.com/downloads/) (Community edition is free)

#### Microsoft SQl Server Tools 2019

- Install From Link [**Microsoft SQl Server Tools 2019**](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16).
- TCP/IP And Server Services Activation [**TCP/IP**](https://blog.devart.com/sql-server-ports.html).

#### Microsoft SQl Server 2022 

- Download From Link [**Microsoft SQl Server 2022**](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) and choose your operation system.
- Read Installation [**Tutorial**](https://www.mssqltips.com/sqlservertip/7313/install-sql-server-2022/) in the Database Engine Configuration check mixed mode authentication and give you <b>sa</b> user a password.
- Download and unzip into the installation path the backup files from [**MYY030_Project/data/*.zip**](https://github.com/siavasiatras/MYY030_Project/tree/main/data).
- Restore the databases DWH, DWH_INTERMEDIATE, DWH_STAGING read [**tutorial**](https://www.ibm.com/docs/en/license-metric-tool?topic=database-restoring-ms-sql-server) if needed.
- Drop the <b>project_user</b> users from the three databases and create a login user [**project_reporter**](https://www.ibm.com/docs/en/capm?topic=monitoring-creating-user-granting-permissions) with <b>db_sysadmin</b>, <b>db_datareader</b>, <b>db_datawriter</b>.

### <div align="center">to be continued...</div>
