use IPL_CS779;

---Team  table creted
CREATE TABLE Team(
Team_Id		numeric(10)	    NOT NULL,
Team_Name	varchar(100)	NOT NULL,
CONSTRAINT Team_Team_Id_PK PRIMARY KEY (Team_Id));

Select * from Team;

CREATE TABLE Player(
Player_Id     numeric(10) NOT NULL,
Player_Name   varchar(100) NOT NULL,
DOB           datetime,
Country_Name  varchar(100),
Batting_hand  varchar(100),
Bowling_skill varchar(100),
CONSTRAINT Player_Player_Id_PK PRIMARY KEY (Player_Id)
 );

Select * from Player;

CREATE TABLE Date(
Date_Id  numeric(10),
Full_date  datetime,
Year  numeric(10),
Month numeric(10),
Day   numeric(10),
Date  numeric(10),
CONSTRAINT Date_Date_Id_PK PRIMARY KEY (Date_Id)
);

select * from Date;

CREATE TABLE Match(
match_id  numeric(10) NOT NULL,
match_date  datetime,
Season_Year numeric(10),
Team1  numeric(10) NOT NULL,
Team2  numeric(10) NOT NULL,
Toss_Winner  numeric(10),
Toss_Name varchar(10),
match_winner  numeric(10),
ManOfMach   numeric(10),
Venue_Name  varchar(100),
City_Name   varchar(100),
Country_Name varchar(100),
CONSTRAINT Match_match_id_PK PRIMARY KEY (match_id),
CONSTRAINT Team_1_FK      FOREIGN KEY (Team1) REFERENCES Team(Team_Id),
CONSTRAINT Team_2_FK      FOREIGN KEY (Team2) REFERENCES Team(Team_Id),
);

select * from Match 




CREATE TABLE Player_match(
Player_match_Id numeric(10) NOT NULL,
Match_Id numeric(10),
Player_Id numeric(10),
Role_Desc  varchar(100),
Player_team_Id numeric(10),
Season_year numeric(10),
is_manofThematch varchar(32),
CONSTRAINT Player_match_Id_PK PRIMARY KEY (Player_match_Id),
CONSTRAINT Match_Id_FK      FOREIGN KEY (Match_Id) REFERENCES Match(match_id),
CONSTRAINT Player_Id_FK     FOREIGN KEY (Player_Id) REFERENCES Player(Player_Id),
CONSTRAINT Player_team_Id_FK     FOREIGN KEY (Player_team_Id) REFERENCES Team(Team_Id)
);

select * from Player_match

CREATE TABLE Ball_by_Ball(
ID numeric(10) NOT NULL,
Match_id numeric(10),
Over_id numeric(10),
Ball_id numeric(10),
Innings_No numeric(10),
Team_Batting numeric(10),
Team_Bowling numeric(10),
Runs_Scored numeric(10),
Extra_runs numeric(10),
Extra_Type varchar(100),
Out_type varchar(100),
Striker_match_Id numeric(10),
NonStriker_match_Id numeric(10),
Bowler_match_Id numeric(10),
Season numeric(10),
CONSTRAINT ID_PK PRIMARY KEY (ID),
CONSTRAINT Ball_Match_Id_FK      FOREIGN KEY (Match_id) REFERENCES Match(match_id),
CONSTRAINT Ball_Team_Batting_FK      FOREIGN KEY (Team_Batting) REFERENCES Team(Team_Id),
CONSTRAINT Ball_Team_Bowling_FK      FOREIGN KEY (Team_Bowling) REFERENCES Team(Team_Id),
CONSTRAINT Ball_Striker_match_Id_FK      FOREIGN KEY (Striker_match_Id) REFERENCES Player_match(Player_match_Id),
CONSTRAINT Ball_NonStriker_match_Id_FK      FOREIGN KEY (NonStriker_match_Id) REFERENCES Player_match(Player_match_Id),
CONSTRAINT Ball_Bowler_match_Id_FK      FOREIGN KEY (Bowler_match_Id) REFERENCES Player_match(Player_match_Id)
);

select * from Ball_by_Ball





CREATE TABLE Winning_Teams(
Year numeric(10) NOT NULL,
Winning_Team_ID numeric(10)
CONSTRAINT Winning_Team_ID_FK FOREIGN KEY (Winning_Team_ID) REFERENCES Team(Team_Id) 
);

Select * from Winning_Teams


