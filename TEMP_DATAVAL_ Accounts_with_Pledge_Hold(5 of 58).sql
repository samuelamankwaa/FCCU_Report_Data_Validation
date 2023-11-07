declare @dl_date date = null

set @dl_date = 
	(
		Select dl_load_Date
		from id.MonthEnd_DL_Load_Dates 
		where [sequence] = 1
	);


		SELECT  
		     s.MEMBER_NBR
			,Account_Nbr = aw.ACCOUNT_NBR
			,sp.LOAN_NBR
			,sp.PLEDGE_AMT


		FROM dbo.SHARE s 

	    JOIN ACCOUNTWARNING aw on s.dl_load_date = aw.dl_load_date and s.MEMBER_NBR = aw.MEMBER_NBR 
		JOIN SHAREPLEDGE sp on s.dl_load_date = sp.dl_load_date and s.MEMBER_NBR = sp.SHARE_MEMBER_NBR 

		WHERE s.DL_LOAD_DATE = @dl_date
			and (s.CLOSED is null or s.CLOSED = 0)
