use IPL_CS779;

CREATE FUNCTION Season(@Year int)
returns @Season_Info table(
							Year int,
							Winner varchar(100),
							Total_runs int,
							No_of_Six int,
							No_of_Four int,
							No_of_Wide_Balls int,
							No_of_NO_Balls int,
							No_of_Wickets int)
as
begin
declare @Season int;
declare @Winner varchar(100);
declare @run_scored int;
declare @extra_run int;
declare @Total_runs int;
declare @No_of_Six int;
declare @No_of_Four int;
declare @No_of_Wide_Balls int;
declare @No_of_NO_Balls int;
declare @No_of_Wickets int;

Set @Season = @Year
set @Winner = (Select Team_Name from Team
				join Winning_Teams on  Team.Team_Id = Winning_Teams.Winning_Team_Id
				where Winning_Teams.Year = @Year )
set @run_scored = (select sum(Runs_Scored) from Ball_by_Ball where season = @Year group by season)
set @extra_run = (select sum(Extra_runs) from Ball_by_Ball where season = @Year group by season)
set @Total_runs = @run_scored + @extra_run
set @No_of_Six = (select count(Runs_Scored) from Ball_by_ball where (season = @Year AND Runs_Scored = 6) group by season)
set @No_of_Four = (select count(Runs_Scored) from Ball_by_ball where (season = @Year AND Runs_Scored = 4)group by season)
set @No_of_Wide_Balls = (select count(Extra_Type) from Ball_by_ball where (season = @Year AND Extra_Type = 'wides' ) group by season)
set @No_of_NO_Balls = (select count(Extra_Type) from Ball_by_ball where (season = @Year AND Extra_Type = 'Noballs' ) group by season)
set @No_of_Wickets = (select count(Out_type) from Ball_by_ball where (season = @Year AND Out_type != 'Not_Applicable' AND Out_type != 'obstructing_the_field' AND Out_type != 'retired_hurt') group by season)

insert into @Season_Info values(@Season,@Winner,@Total_runs,@No_of_Six,@No_of_Four,@No_of_Wide_Balls,@No_of_NO_Balls,@No_of_Wickets)
return
end


Select * from dbo.Season(2008)
Select * from dbo.Season(2009)
Select * from dbo.Season(2010)
Select * from dbo.Season(2011)
Select * from dbo.Season(2012)
Select * from dbo.Season(2013)
Select * from dbo.Season(2014)
Select * from dbo.Season(2015)
Select * from dbo.Season(2016)
Select * from dbo.Season(2017)

--Error case--
Select * from dbo.Season(2007)