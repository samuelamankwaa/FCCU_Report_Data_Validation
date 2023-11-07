declare @dl_date date = null

set @dl_date = 
	(
		Select dl_load_Date
		from id.MonthEnd_DL_Load_Dates 
		where [sequence] = 1
	);


		SELECT  MEMBER_NBR = s.MEMBER_NBR
			, ACCOUNT_NBR = s.SHARE_NBR
			, WC1 = Case when aw1.WARNING_CODE is null then '' else 'Y' End
			, WC5 = Case when aw5.WARNING_CODE is null then '' else 'Y' End
			, WC11 = Case when aw11.WARNING_CODE is null then '' else 'Y' End
			, WC12 = Case when aw12.WARNING_CODE is null then '' else 'Y' End
			, WC13 = Case when aw13.WARNING_CODE is null then '' else 'Y' End
			, WC15 = Case when aw15.WARNING_CODE is null then '' else 'Y' End
			, WC16 = Case when aw16.WARNING_CODE is null then '' else 'Y' End
			, WC20 = Case when aw20.WARNING_CODE is null then '' else 'Y' End
			, ALERT = Case when al.IS_SBA_ALERT is null then '' else 'Y' End


		FROM dbo.SHARE s 

		LEFT JOIN ACCOUNTWARNING aw1 on s.dl_load_date = aw1.dl_load_date and s.MEMBER_NBR = aw1.MEMBER_NBR and s.SHARE_NBR = aw1.ACCOUNT_NBR and aw1.WARNING_CODE = 1
		LEFT JOIN ACCOUNTWARNING aw5 on s.dl_load_date = aw5.dl_load_date and s.MEMBER_NBR = aw5.MEMBER_NBR and s.SHARE_NBR = aw5.ACCOUNT_NBR and aw5.WARNING_CODE = 5
		LEFT JOIN ACCOUNTWARNING aw11 on s.dl_load_date = aw11.dl_load_date and s.MEMBER_NBR = aw11.MEMBER_NBR and s.SHARE_NBR = aw11.ACCOUNT_NBR and aw11.WARNING_CODE = 11
		LEFT JOIN ACCOUNTWARNING aw12 on s.dl_load_date = aw12.dl_load_date and s.MEMBER_NBR = aw12.MEMBER_NBR and s.SHARE_NBR = aw12.ACCOUNT_NBR and aw12.WARNING_CODE = 12
		LEFT JOIN ACCOUNTWARNING aw13 on s.dl_load_date = aw13.dl_load_date and s.MEMBER_NBR = aw13.MEMBER_NBR and s.SHARE_NBR = aw13.ACCOUNT_NBR and aw12.WARNING_CODE = 13
		LEFT JOIN ACCOUNTWARNING aw15 on s.dl_load_date = aw15.dl_load_date and s.MEMBER_NBR = aw15.MEMBER_NBR and s.SHARE_NBR = aw15.ACCOUNT_NBR and aw15.WARNING_CODE = 15
		LEFT JOIN ACCOUNTWARNING aw16 on s.dl_load_date = aw16.dl_load_date and s.MEMBER_NBR = aw16.MEMBER_NBR and s.SHARE_NBR = aw16.ACCOUNT_NBR and aw15.WARNING_CODE = 16
		LEFT JOIN ACCOUNTWARNING aw20 on s.dl_load_date = aw20.dl_load_date and s.MEMBER_NBR = aw20.MEMBER_NBR and s.SHARE_NBR = aw20.ACCOUNT_NBR and aw20.WARNING_CODE = 20
		LEFT JOIN ACCOUNTWARNING al on s.dl_load_date = al.dl_load_date and s.MEMBER_NBR = al.MEMBER_NBR and s.SHARE_NBR = al.ACCOUNT_NBR and al.IS_SBA_ALERT = 0


		WHERE s.DL_LOAD_DATE = @dl_date
			and (s.CLOSED is null or s.CLOSED = 0)


	    UNION ALL

      		SELECT  MEMBER_NBR = l.MEMBER_NBR
			, ACCOUNT_NBR = l.LOAN_NBR
			, WC1 = Case when aw1.WARNING_CODE is null then '' else 'Y' End
			, WC5 = Case when aw5.WARNING_CODE is null then '' else 'Y' End
			, WC11 = Case when aw11.WARNING_CODE is null then '' else 'Y' End
			, WC12 = Case when aw12.WARNING_CODE is null then '' else 'Y' End
			, WC13 = Case when aw13.WARNING_CODE is null then '' else 'Y' End
			, WC15 = Case when aw15.WARNING_CODE is null then '' else 'Y' End
			, WC16 = Case when aw16.WARNING_CODE is null then '' else 'Y' End
			, WC20 = Case when aw20.WARNING_CODE is null then '' else 'Y' End
			, ALERT = Case when al.IS_SBA_ALERT is null then '' else 'Y' End


		FROM dbo.loan l 

		LEFT JOIN ACCOUNTWARNING aw1 on l.dl_load_date = aw1.dl_load_date and l.MEMBER_NBR = aw1.MEMBER_NBR and l.LOAN_NBR = aw1.ACCOUNT_NBR and aw1.WARNING_CODE = 1
		LEFT JOIN ACCOUNTWARNING aw5 on l.dl_load_date = aw5.dl_load_date and l.MEMBER_NBR = aw5.MEMBER_NBR and l.LOAN_NBR = aw5.ACCOUNT_NBR and aw5.WARNING_CODE = 5
		LEFT JOIN ACCOUNTWARNING aw11 on l.dl_load_date = aw11.dl_load_date and l.MEMBER_NBR = aw11.MEMBER_NBR and l.LOAN_NBR = aw11.ACCOUNT_NBR and aw11.WARNING_CODE = 11
		LEFT JOIN ACCOUNTWARNING aw12 on l.dl_load_date = aw12.dl_load_date and l.MEMBER_NBR = aw12.MEMBER_NBR and l.LOAN_NBR = aw12.ACCOUNT_NBR and aw12.WARNING_CODE = 12
		LEFT JOIN ACCOUNTWARNING aw13 on l.dl_load_date = aw13.dl_load_date and l.MEMBER_NBR = aw13.MEMBER_NBR and l.LOAN_NBR = aw13.ACCOUNT_NBR and aw12.WARNING_CODE = 13
		LEFT JOIN ACCOUNTWARNING aw15 on l.dl_load_date = aw15.dl_load_date and l.MEMBER_NBR = aw15.MEMBER_NBR and l.LOAN_NBR = aw15.ACCOUNT_NBR and aw15.WARNING_CODE = 15
		LEFT JOIN ACCOUNTWARNING aw16 on l.dl_load_date = aw16.dl_load_date and l.MEMBER_NBR = aw16.MEMBER_NBR and l.LOAN_NBR = aw16.ACCOUNT_NBR and aw15.WARNING_CODE = 16
		LEFT JOIN ACCOUNTWARNING aw20 on l.dl_load_date = aw20.dl_load_date and l.MEMBER_NBR = aw20.MEMBER_NBR and l.LOAN_NBR = aw20.ACCOUNT_NBR and aw20.WARNING_CODE = 20
		LEFT JOIN ACCOUNTWARNING al on l.dl_load_date = al.dl_load_date and l.MEMBER_NBR= al.MEMBER_NBR and l.LOAN_NBR = al.ACCOUNT_NBR and al.IS_SBA_ALERT = 0


		WHERE l.DL_LOAD_DATE = @dl_date
			and (l.CLOSED is null or l.CLOSED = 0)




