declare @dl_date date = null

set @dl_date = 
	(
		Select dl_load_Date
		from id.MonthEnd_DL_Load_Dates 
		where [sequence] = 1
	);


		SELECT  MEMBER_NBR = s.MEMBER_NBR
			, INDIVIDUAL_ID = s.SHARE_NBR
			, WC1 = Case when aw1.WARNING_CODE is null then '' else 'Y' End
			, WC5 = Case when aw5.WARNING_CODE is null then '' else 'Y' End
			, WC11 = Case when aw11.WARNING_CODE is null then '' else 'Y' End
			, WC12 = Case when aw12.WARNING_CODE is null then '' else 'Y' End
			, WC13 = Case when aw13.WARNING_CODE is null then '' else 'Y' End
			, WC15 = Case when aw15.WARNING_CODE is null then '' else 'Y' End
			, WC16 = Case when aw16.WARNING_CODE is null then '' else 'Y' End
			, WC20 = Case when aw20.WARNING_CODE is null then '' else 'Y' End
			, ALERT = Case when al.WARNING_TEXT is null then '' else 'Y' End


		FROM dbo.SHARE s 

		LEFT JOIN INDIVIDUALWARNING aw1 on s.dl_load_date = aw1.dl_load_date and s.MEMBER_NBR = aw1.INDIVIDUAL_ID and s.SHARE_NBR = aw1.INDIVIDUAL_ID and aw1.WARNING_CODE = 1
		LEFT JOIN INDIVIDUALWARNING aw5 on s.dl_load_date = aw5.dl_load_date and s.MEMBER_NBR = aw5.INDIVIDUAL_ID and s.SHARE_NBR = aw5.INDIVIDUAL_ID and aw5.WARNING_CODE = 5
		LEFT JOIN INDIVIDUALWARNING aw11 on s.dl_load_date = aw11.dl_load_date and s.MEMBER_NBR = aw11.INDIVIDUAL_ID and s.SHARE_NBR = aw11.INDIVIDUAL_ID and aw11.WARNING_CODE = 11
		LEFT JOIN INDIVIDUALWARNING aw12 on s.dl_load_date = aw12.dl_load_date and s.MEMBER_NBR = aw12.INDIVIDUAL_ID and s.SHARE_NBR = aw12.INDIVIDUAL_ID and aw12.WARNING_CODE = 12
		LEFT JOIN INDIVIDUALWARNING aw13 on s.dl_load_date = aw13.dl_load_date and s.MEMBER_NBR = aw13.INDIVIDUAL_ID and s.SHARE_NBR = aw13.INDIVIDUAL_ID and aw12.WARNING_CODE = 13
		LEFT JOIN INDIVIDUALWARNING aw15 on s.dl_load_date = aw15.dl_load_date and s.MEMBER_NBR = aw15.INDIVIDUAL_ID and s.SHARE_NBR = aw15.INDIVIDUAL_ID and aw15.WARNING_CODE = 15
		LEFT JOIN INDIVIDUALWARNING aw16 on s.dl_load_date = aw16.dl_load_date and s.MEMBER_NBR = aw16.INDIVIDUAL_ID and s.SHARE_NBR = aw16.INDIVIDUAL_ID and aw15.WARNING_CODE = 16
		LEFT JOIN INDIVIDUALWARNING aw20 on s.dl_load_date = aw20.dl_load_date and s.MEMBER_NBR = aw20.INDIVIDUAL_ID and s.SHARE_NBR = aw20.INDIVIDUAL_ID and aw20.WARNING_CODE = 20
		LEFT JOIN INDIVIDUALWARNING al on s.dl_load_date = al.dl_load_date and s.MEMBER_NBR = al.INDIVIDUAL_ID and s.SHARE_NBR = al.INDIVIDUAL_ID and al.WARNING_TEXT = NULL


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
			, ALERT = Case when al.WARNING_TEXT is null then '' else 'Y' End


		FROM dbo.loan l 

		LEFT JOIN INDIVIDUALWARNING aw1 on l.dl_load_date = aw1.dl_load_date and l.MEMBER_NBR = aw1.INDIVIDUAL_ID and l.LOAN_NBR = aw1.INDIVIDUAL_ID and aw1.WARNING_CODE = 1
		LEFT JOIN INDIVIDUALWARNING aw5 on l.dl_load_date = aw5.dl_load_date and l.MEMBER_NBR = aw5.INDIVIDUAL_ID and l.LOAN_NBR = aw5.INDIVIDUAL_ID and aw5.WARNING_CODE = 5
		LEFT JOIN INDIVIDUALWARNING aw11 on l.dl_load_date = aw11.dl_load_date and l.MEMBER_NBR = aw11.INDIVIDUAL_ID and l.LOAN_NBR = aw11.INDIVIDUAL_ID and aw11.WARNING_CODE = 11
		LEFT JOIN INDIVIDUALWARNING aw12 on l.dl_load_date = aw12.dl_load_date and l.MEMBER_NBR = aw12.INDIVIDUAL_ID and l.LOAN_NBR = aw12.INDIVIDUAL_ID and aw12.WARNING_CODE = 12
		LEFT JOIN INDIVIDUALWARNING aw13 on l.dl_load_date = aw13.dl_load_date and l.MEMBER_NBR = aw13.INDIVIDUAL_ID and l.LOAN_NBR = aw13.INDIVIDUAL_ID and aw12.WARNING_CODE = 13
		LEFT JOIN INDIVIDUALWARNING aw15 on l.dl_load_date = aw15.dl_load_date and l.MEMBER_NBR = aw15.INDIVIDUAL_ID and l.LOAN_NBR = aw15.INDIVIDUAL_ID and aw15.WARNING_CODE = 15
		LEFT JOIN INDIVIDUALWARNING aw16 on l.dl_load_date = aw16.dl_load_date and l.MEMBER_NBR = aw16.INDIVIDUAL_ID and l.LOAN_NBR = aw16.INDIVIDUAL_ID and aw15.WARNING_CODE = 16
		LEFT JOIN INDIVIDUALWARNING aw20 on l.dl_load_date = aw20.dl_load_date and l.MEMBER_NBR = aw20.INDIVIDUAL_ID and l.LOAN_NBR = aw20.INDIVIDUAL_ID and aw20.WARNING_CODE = 20
		LEFT JOIN INDIVIDUALWARNING al on l.dl_load_date = al.dl_load_date and l.MEMBER_NBR= al.INDIVIDUAL_ID and l.LOAN_NBR = al.INDIVIDUAL_ID and al.WARNING_TEXT = NULL


		WHERE l.DL_LOAD_DATE = @dl_date
			and (l.CLOSED is null or l.CLOSED = 0)
