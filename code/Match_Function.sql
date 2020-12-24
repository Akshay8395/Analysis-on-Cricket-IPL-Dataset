use IPL_CS779;

CREATE FUNCTION Match_info(@Match_Id int)
returns @Match_info table(
						  Match_Date Datetime,
						  Team1 varchar(100),
						  Team2 varchar(100),
						  Toss_winner varchar(100),
						  Match_winner varchar(100),
						  Man_of_the_Match varchar(100),
						  Stadium varchar(100))
as
begin

declare @Match_date datetime;
declare @Team1_Name  varchar(100);
declare @Team2_Name  varchar(100);
declare @Toss_winner_id integer;
declare @Match_winner_id integer;
declare @Man_of_the_Match_id integer;
declare @Stadium  varchar(100);
declare @Toss_winner_Name varchar(100);
declare @Match_winner_Name varchar(100);
declare @Man_of_the_Match_name varchar(100);
declare @invalid_match_id integer;



set @Match_date = (select match_date from match where match_id = @Match_Id)
set @Team1_Name = (select Team_Name from Team 
				   join Match on Team.Team_Id = Match.Team1
                   where Match.match_id = @Match_Id)
set @Team2_Name = (select Team_Name from Team 
				   join Match on Team.Team_Id = Match.Team2
                   where Match.match_id = @Match_Id)
Set @Stadium = (select Venue_Name from Match where match_id = @Match_Id)
Set @Toss_winner_id = (select Toss_Winner from Match where match_id = @Match_Id)

		if @Toss_winner_id = 0 
		BEGIN
			Set  @Toss_winner_Name = 'Match_abandoned'
			
		end
		else
		begin
			set @Toss_winner_Name = (select Team_Name from team where Team_Id = @Toss_winner_id)
		end



Set @Match_winner_id = (select match_winner from Match where match_id = @Match_Id)

		if (@Match_winner_id = 0)
		begin
			set @Match_winner_Name = 'No result'
			set @Man_of_the_Match_name =  'No result'
		end
		else
		begin
		 set @Match_winner_Name = (select Team_Name from team where Team_Id = @Match_winner_id)
		 set @Man_of_the_Match_id = (select manofmach from match where  match_id = @Match_Id)
		 set @Man_of_the_Match_name = (select player_name from player where Player_Id = @Man_of_the_Match_id)
		end
		


insert into @Match_info values(@Match_date,@Team1_Name,@Team2_Name,@Toss_winner_Name,@Match_winner_Name,@Man_of_the_Match_name,@Stadium)
return
end

---Test cases---
select * from dbo.Match_info(1)
select * from dbo.Match_info(335988)
select * from dbo.Match_info(1082619)



select * from dbo.Match_info(598028)



