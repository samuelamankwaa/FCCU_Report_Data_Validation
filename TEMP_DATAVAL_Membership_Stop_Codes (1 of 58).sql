declare @dl_date date = null

set @dl_date = 
	(
		Select dl_load_Date
		from id.MonthEnd_DL_Load_Dates 
		where [sequence] = 1
	);


		SELECT  MEMBER_NBR = s.MEMBER_NBR			
			, W1 = Case when mw1.WARNING_CODE is null then '' else 'Y' End
			, W2 = Case when mw2.WARNING_CODE is null then '' else 'Y' End
			, W3 = Case when mw3.WARNING_CODE is null then '' else 'Y' End
			, W5 = Case when mw5.WARNING_CODE is null then '' else 'Y' End
			, W6 = Case when mw6.WARNING_CODE is null then '' else 'Y' End
			, W7 = Case when mw7.WARNING_CODE is null then '' else 'Y' End
			, W8 = Case when mw8.WARNING_CODE is null then '' else 'Y' End
			, W9 = Case when mw9.WARNING_CODE is null then '' else 'Y' End
			, W10 = Case when mw10.WARNING_CODE is null then '' else 'Y' End
			, W11 = Case when mw11.WARNING_CODE is null then '' else 'Y' End
			, W12 = Case when mw12.WARNING_CODE is null then '' else 'Y' End
			, W13 = Case when mw13.WARNING_CODE is null then '' else 'Y' End
			, W14 = Case when mw14.WARNING_CODE is null then '' else 'Y' End
			, W15 = Case when mw15.WARNING_CODE is null then '' else 'Y' End
			, W16 = Case when mw16.WARNING_CODE is null then '' else 'Y' End
			, W17 = Case when mw17.WARNING_CODE is null then '' else 'Y' End
			, W18 = Case when mw18.WARNING_CODE is null then '' else 'Y' End
			, W19 = Case when mw19.WARNING_CODE is null then '' else 'Y' End
			, W20 = Case when mw20.WARNING_CODE is null then '' else 'Y' End
			, ALERT = Case when al.IS_SBA_ALERT is null then '' else 'Y' End


		FROM dbo.SHARE s 

		LEFT JOIN MEMBERSHIPWARNING mw1 on s.dl_load_date = mw1.dl_load_date and s.MEMBER_NBR = mw1.MEMBER_NBR and mw1.WARNING_CODE = 1
		LEFT JOIN MEMBERSHIPWARNING mw2 on s.dl_load_date = mw2.dl_load_date and s.MEMBER_NBR = mw2.MEMBER_NBR and mw2.WARNING_CODE = 2
		LEFT JOIN MEMBERSHIPWARNING mw3 on s.dl_load_date = mw3.dl_load_date and s.MEMBER_NBR = mw3.MEMBER_NBR and mw3.WARNING_CODE = 3
		LEFT JOIN MEMBERSHIPWARNING mw5 on s.dl_load_date = mw5.dl_load_date and s.MEMBER_NBR = mw5.MEMBER_NBR and mw5.WARNING_CODE = 5
		LEFT JOIN MEMBERSHIPWARNING mw6 on s.dl_load_date = mw6.dl_load_date and s.MEMBER_NBR = mw6.MEMBER_NBR and mw6.WARNING_CODE = 6
		LEFT JOIN MEMBERSHIPWARNING mw7 on s.dl_load_date = mw7.dl_load_date and s.MEMBER_NBR = mw7.MEMBER_NBR and mw7.WARNING_CODE = 7
		LEFT JOIN MEMBERSHIPWARNING mw8 on s.dl_load_date = mw8.dl_load_date and s.MEMBER_NBR = mw8.MEMBER_NBR and mw8.WARNING_CODE = 8
		LEFT JOIN MEMBERSHIPWARNING mw9 on s.dl_load_date = mw9.dl_load_date and s.MEMBER_NBR = mw9.MEMBER_NBR and mw9.WARNING_CODE = 9
		LEFT JOIN MEMBERSHIPWARNING mw10 on s.dl_load_date = mw10.dl_load_date and s.MEMBER_NBR = mw10.MEMBER_NBR and mw10.WARNING_CODE = 10
		LEFT JOIN MEMBERSHIPWARNING mw11 on s.dl_load_date = mw11.dl_load_date and s.MEMBER_NBR = mw11.MEMBER_NBR and mw11.WARNING_CODE = 11
		LEFT JOIN MEMBERSHIPWARNING mw12 on s.dl_load_date = mw12.dl_load_date and s.MEMBER_NBR = mw12.MEMBER_NBR and mw12.WARNING_CODE = 12
		LEFT JOIN MEMBERSHIPWARNING mw13 on s.dl_load_date = mw13.dl_load_date and s.MEMBER_NBR = mw13.MEMBER_NBR and mw13.WARNING_CODE = 13
		LEFT JOIN MEMBERSHIPWARNING mw14 on s.dl_load_date = mw14.dl_load_date and s.MEMBER_NBR = mw14.MEMBER_NBR and mw14.WARNING_CODE = 14
		LEFT JOIN MEMBERSHIPWARNING mw15 on s.dl_load_date = mw15.dl_load_date and s.MEMBER_NBR = mw15.MEMBER_NBR and mw15.WARNING_CODE = 15
		LEFT JOIN MEMBERSHIPWARNING mw16 on s.dl_load_date = mw16.dl_load_date and s.MEMBER_NBR = mw16.MEMBER_NBR and mw16.WARNING_CODE = 16
		LEFT JOIN MEMBERSHIPWARNING mw17 on s.dl_load_date = mw17.dl_load_date and s.MEMBER_NBR = mw17.MEMBER_NBR and mw17.WARNING_CODE = 17
		LEFT JOIN MEMBERSHIPWARNING mw18 on s.dl_load_date = mw18.dl_load_date and s.MEMBER_NBR = mw18.MEMBER_NBR and mw18.WARNING_CODE = 18
		LEFT JOIN MEMBERSHIPWARNING mw19 on s.dl_load_date = mw19.dl_load_date and s.MEMBER_NBR = mw19.MEMBER_NBR and mw19.WARNING_CODE = 19
		LEFT JOIN MEMBERSHIPWARNING mw20 on s.dl_load_date = mw20.dl_load_date and s.MEMBER_NBR = mw20.MEMBER_NBR and mw20.WARNING_CODE = 20
		LEFT JOIN MEMBERSHIPWARNING al on s.dl_load_date = al.dl_load_date and s.MEMBER_NBR = al.MEMBER_NBR and al.IS_SBA_ALERT = 0


		WHERE s.DL_LOAD_DATE = @dl_date
			and (s.CLOSED is null or s.CLOSED = 0)


	    UNION ALL

      		SELECT  MEMBER_NBR = l.MEMBER_NBR			
			, W1 = Case when mw1.WARNING_CODE is null then '' else 'Y' End
			, W2 = Case when mw2.WARNING_CODE is null then '' else 'Y' End
			, W3 = Case when mw3.WARNING_CODE is null then '' else 'Y' End
			, W5 = Case when mw5.WARNING_CODE is null then '' else 'Y' End
			, W6 = Case when mw6.WARNING_CODE is null then '' else 'Y' End
			, W7 = Case when mw7.WARNING_CODE is null then '' else 'Y' End
			, W8 = Case when mw8.WARNING_CODE is null then '' else 'Y' End
			, W9 = Case when mw9.WARNING_CODE is null then '' else 'Y' End
			, W10 = Case when mw10.WARNING_CODE is null then '' else 'Y' End
			, W11 = Case when mw11.WARNING_CODE is null then '' else 'Y' End
			, W12 = Case when mw12.WARNING_CODE is null then '' else 'Y' End
			, W13 = Case when mw13.WARNING_CODE is null then '' else 'Y' End
			, W14 = Case when mw14.WARNING_CODE is null then '' else 'Y' End
			, W15 = Case when mw15.WARNING_CODE is null then '' else 'Y' End
			, W16 = Case when mw16.WARNING_CODE is null then '' else 'Y' End
			, W17 = Case when mw17.WARNING_CODE is null then '' else 'Y' End
			, W18 = Case when mw18.WARNING_CODE is null then '' else 'Y' End
			, W19 = Case when mw19.WARNING_CODE is null then '' else 'Y' End
			, W20 = Case when mw20.WARNING_CODE is null then '' else 'Y' End
			, ALERT = Case when al.IS_SBA_ALERT is null then '' else 'Y' End


		FROM dbo.Loan l 

		LEFT JOIN MEMBERSHIPWARNING mw1 on l.dl_load_date = mw1.dl_load_date and l.MEMBER_NBR = mw1.MEMBER_NBR and mw1.WARNING_CODE = 1
		LEFT JOIN MEMBERSHIPWARNING mw2 on l.dl_load_date = mw2.dl_load_date and l.MEMBER_NBR = mw2.MEMBER_NBR and mw2.WARNING_CODE = 2
		LEFT JOIN MEMBERSHIPWARNING mw3 on l.dl_load_date = mw3.dl_load_date and l.MEMBER_NBR = mw3.MEMBER_NBR and mw3.WARNING_CODE = 3
		LEFT JOIN MEMBERSHIPWARNING mw5 on l.dl_load_date = mw5.dl_load_date and l.MEMBER_NBR = mw5.MEMBER_NBR and mw5.WARNING_CODE = 5
		LEFT JOIN MEMBERSHIPWARNING mw6 on l.dl_load_date = mw6.dl_load_date and l.MEMBER_NBR = mw6.MEMBER_NBR and mw6.WARNING_CODE = 6
		LEFT JOIN MEMBERSHIPWARNING mw7 on l.dl_load_date = mw7.dl_load_date and l.MEMBER_NBR = mw7.MEMBER_NBR and mw7.WARNING_CODE = 7
		LEFT JOIN MEMBERSHIPWARNING mw8 on l.dl_load_date = mw8.dl_load_date and l.MEMBER_NBR = mw8.MEMBER_NBR and mw8.WARNING_CODE = 8
		LEFT JOIN MEMBERSHIPWARNING mw9 on l.dl_load_date = mw9.dl_load_date and l.MEMBER_NBR = mw9.MEMBER_NBR and mw9.WARNING_CODE = 9
		LEFT JOIN MEMBERSHIPWARNING mw10 on l.dl_load_date = mw10.dl_load_date and l.MEMBER_NBR = mw10.MEMBER_NBR and mw10.WARNING_CODE = 10
		LEFT JOIN MEMBERSHIPWARNING mw11 on l.dl_load_date = mw11.dl_load_date and l.MEMBER_NBR = mw11.MEMBER_NBR and mw11.WARNING_CODE = 11
		LEFT JOIN MEMBERSHIPWARNING mw12 on l.dl_load_date = mw12.dl_load_date and l.MEMBER_NBR = mw12.MEMBER_NBR and mw12.WARNING_CODE = 12
		LEFT JOIN MEMBERSHIPWARNING mw13 on l.dl_load_date = mw13.dl_load_date and l.MEMBER_NBR = mw13.MEMBER_NBR and mw13.WARNING_CODE = 13
		LEFT JOIN MEMBERSHIPWARNING mw14 on l.dl_load_date = mw14.dl_load_date and l.MEMBER_NBR = mw14.MEMBER_NBR and mw14.WARNING_CODE = 14
		LEFT JOIN MEMBERSHIPWARNING mw15 on l.dl_load_date = mw15.dl_load_date and l.MEMBER_NBR = mw15.MEMBER_NBR and mw15.WARNING_CODE = 15
		LEFT JOIN MEMBERSHIPWARNING mw16 on l.dl_load_date = mw16.dl_load_date and l.MEMBER_NBR = mw16.MEMBER_NBR and mw16.WARNING_CODE = 16
		LEFT JOIN MEMBERSHIPWARNING mw17 on l.dl_load_date = mw17.dl_load_date and l.MEMBER_NBR = mw17.MEMBER_NBR and mw17.WARNING_CODE = 17
		LEFT JOIN MEMBERSHIPWARNING mw18 on l.dl_load_date = mw18.dl_load_date and l.MEMBER_NBR = mw18.MEMBER_NBR and mw18.WARNING_CODE = 18
		LEFT JOIN MEMBERSHIPWARNING mw19 on l.dl_load_date = mw19.dl_load_date and l.MEMBER_NBR = mw19.MEMBER_NBR and mw19.WARNING_CODE = 19
		LEFT JOIN MEMBERSHIPWARNING mw20 on l.dl_load_date = mw20.dl_load_date and l.MEMBER_NBR = mw20.MEMBER_NBR and mw20.WARNING_CODE = 20
		LEFT JOIN MEMBERSHIPWARNING al on l.dl_load_date = al.dl_load_date and l.MEMBER_NBR = al.MEMBER_NBR and al.IS_SBA_ALERT = 0


		WHERE l.DL_LOAD_DATE = @dl_date
			and (l.CLOSED is null or l.CLOSED = 0)



