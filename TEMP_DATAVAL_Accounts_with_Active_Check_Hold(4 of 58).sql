declare @dl_date date = null

set @dl_date = 
	(
		Select dl_load_Date
		from id.MonthEnd_DL_Load_Dates 
		where [sequence] = 1
	);


		SELECT  
		     a.MEMBER_NBR 
			, a.ACCT_NBR 
			, a.HOLD_AMT
			
		FROM dbo.ACCOUNTHISTORY a

		

		WHERE a.DL_LOAD_DATE = @dl_date
			

