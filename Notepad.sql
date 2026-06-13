
---------------------------------------
------- Learn SQL (Online)-------------
---------------------------------------
--Tournament Management System (tms)---
---------------------------------------
------SQL Queries & Commands-----------
---------------------------------------
--SQL Query sample: Show the name and phone number of organizer who organized the Super Cup.
--retrieve-- command --> SELECT
    SELECT organizer.organizer_name, organizer.phone 
    FROM organizer, tournament 
    WHERE organizer.organizer_id = tournament.organizer_id 
    AND tournament.tournament_name = 'Super Cup'; 
-----Homeowrk----
--Q2: find the name, contact number and address of all organizers;
    SELECT organizer_name, phone, address FROM `organizer`;

--Q3: Show the playing roles for players.
    SELECT player_name, role FROM `player`;

--Q4: Find the list of all batsman;
    SELECT * FROM `player` WHERE role = 'Batsman'; 

--Q5: Find the list of all right handed batsman;
    SELECT * FROM `player` WHERE role = 'Batsman' 
    AND batting_style = 'Right Hand'; 

-----Practice-----
------------------
--Show the list of all organizer who are from dhaka or khulna.
    SELECT * FROM Organizer WHERE address='Dhaka' OR address='Khulna';
--Show the list of all fast bowlers.
    SELECT * FROM Player WHERE role='Bowler' AND bowling_style='Fast';
--Find the umpires who are from India having more than 5 years of experieces.
    SELECT * FROM Umpire WHERE country='India' AND experience>5;
--Find the team that name start with letter T.  
    SELECT * FROM Team WHERE team_name LIKE 'T%';

---ORDER BY, LIMIT, OFFSET-----
----------------------------
--Show the team list in a sorted order according to their name in alaphabetically.
    SELECT * FROM Team ORDER By team_name ASC;
--show the 1st three umpires list sorted according to their experience (max to min);
    SELECT * FROM Umpire ORDER BY experience DESC LIMIT 3; 
--person having 3rd in experiences
    SELECT * FROM Umpire ORDER BY experience DESC LIMIT 1 OFFSET 2; 

--GROUP BY, HAVING---
-------------------------
--Find the list of number of players in each role;
    SELECT role, COUNT(*) FROM Player
    GROUP BY role;
--Find the list of number of players having 3 or more in each role;
    SELECT role, COUNT(*) FROM Player GROUP BY role HAVING COUNT(role)>=3;

----------------------------------
-------------Practice-------------
----------------------------------
1. Show only player name and role.
2.  Show matches that are completed.
3. Show players whose role is Batsman.
4. Show venues by capacity (highest first).
5. Show players by jersey number;
6. Count total players.
7. Find maximum stadium capacity.
    SELECT 'Max Capacity', MAX(capacity) FROM `venue`
8. Find the details of stadium that has maximum capacity (***).
    SELECT * FROM venue
    WHERE capacity = (SELECT MAX(capacity) FROM venue);

    --SELECT MAX(capacity) FROM venue;

9. Average umpire experience.
    SELECT AVG(experience) FROM `umpire`
10. Count players by role (Group By).
    SELECT role, COUNT(*) FROM `player` GROUP BY role; 
11. Count teams in each tournament (Group By).
    SELECT tournament.tournament_name, COUNT(team.team_id) 
    FROM `team`, tournament
    GROUP BY tournament.tournament_name; 
12. Show roles having at least 2 players (Group by, having).
    SELECT role, COUNT(*) FROM `player` 
    GROUP BY role HAVING COUNT(*) >= 2; 
13. Show players from team Tigers (***).
    SELECT * FROM `player`, team
    WHERE player.team_id = team.team_id 
    AND team_name = 'Tigers'; 
14. Find which team played most matches (***).
    SELECT team.team_name, COUNT(team.team_id) 
    FROM `matchinfo`, team 
    WHERE team.team_id = matchinfo.team1_id 
    OR team.team_id = matchinfo.team2_id 
    GROUP BY team.team_name; 
15. Find total runs scored by each player (***).
    SELECT player.player_name, scorecard.runs 
    FROM `scorecard`, player
    WHERE player.player_id = scorecard.player_id; 

-----------------Join------------------
--Q: write sql to join the tables team and player.
    SELECT Team.*, Player.*
    FROM Team INNER JOIN Player
    ON Team.team_id=Player.team_id;
--Or (Mine)
    SELECT * FROM `player` JOIN team 
    ON team.team_id = player.team_id;

/*Q: Show the following info of a player: player name, jersey number, playing role, 
team name, coach name. */

    SELECT Player.player_name, Player.jersey_no, Player.role, Team.team_name, Team.coach_name
    FROM Team INNER JOIN Player
    ON Team.team_id=Player.team_id;

    SELECT P.player_name, P.jersey_no, P.role, T.team_name, T.coach_name
    FROM Team as T INNER JOIN Player P
    ON T.team_id=P.team_id;
--Or (Mine without join)
    SELECT player.player_name, player.jersey_no, player.role, team.team_name, team.coach_name 
    FROM `team`, player 
    WHERE team.team_id = player.team_id;

--Find the name of coach of Player4;
    SELECT Player.player_name, Team.coach_name
    FROM Team INNER JOIN Player
    ON Team.team_id=Player.team_id
    WHERE Player.player_name='Player4';
--Or (Mine without join)
    SELECT player.player_name, team.coach_name 
    FROM player, team WHERE player_name = 'Player4' 
    AND player.team_id = team.team_id; 

----------------views------------------

    CREATE VIEW Player_info AS
    SELECT Player.player_name, Player.jersey_no, Player.role, Team.team_name, Team.coach_name
    FROM Team INNER JOIN Player
    ON Team.team_id=Player.team_id;

--Find the details of stadium that has maximum capacity (***).

    SELECT * FROM venue
    WHERE capacity = (SELECT MAX(capacity) FROM venue);

--find the details of players whose bowling style is same as Player2;
    SELECt * FROM Player
    WHERE bowling_style=(SELECT bowling_style FROM PLayer WHERE player_name='Player2');

--find the details of players whose playing role is same as Player2 or Player3;
    SELECT * FROM Player
    WHERE role IN (SELECT role FROM player WHERE player_name='Player2' OR player_name='Player3');

--------------------------------------------------------------------------
--Practice Query on tms database for all topics (Basic to Advanced)-------
--------------------------------------------------------------------------
---Basic Level
1. Write an SQL query to display all records from the Team table.
2. Write an SQL query to display player name, role, and jersey number from the Player table.
3.Write an SQL query to display all tournaments.
4.Write an SQL query to display all players whose role is Batsman.
5.Write an SQL query to display all matches whose status is Completed.
6.Write an SQL query to display venues having capacity greater than 20,000.
7. Write an SQL query to display umpires whose experience is greater than 5 years.
8. Write an SQL query to display players ordered by jersey number in ascending order.
9. Write an SQL query to display teams ordered alphabetically.
10. Write an SQL query to display the first 5 players from the Player table.

----Intermediate Level
11. Write an SQL query to count the total number of players.
12. Write an SQL query to count the total number of teams.
13. Write an SQL query to find the highest stadium capacity.
14. Write an SQL query to find the minimum umpire experience.
15. Write an SQL query to find the average umpire experience.
16. Write an SQL query to find the total runs scored in the Scorecard table.
17. Write an SQL query to display players whose jersey number is between 10 and 15.
18. Write an SQL query to display players whose name starts with P.
19. Write an SQL query to display tournaments of format T20.
20. Write an SQL query to display matches held after '2025-01-10'.

----Group By and Having
21. Write an SQL query to count the number of players in each role.
22. Write an SQL query to count the number of teams in each tournament.
23. Write an SQL query to display the total runs scored by each player.
24. Write an SQL query to display the average runs of each player.
25. Write an SQL query to display roles having at least 2 players.
26. Write an SQL query to display teams having more than one player.
    --Hints: COUNT, WHERE, GROUP BY & HAVING
27. Write an SQL query to display the number of matches played in each round type.
28. Write an SQL query to display tournaments having more than 5 teams.

---joins
29. Write an SQL query to display player name with team name.
    SELECT player.player_name, team.team_name FROM `player`
    JOIN team ON player.team_id = team.team_id;
    --without join
    SELECT player.player_name, team.team_name 
    FROM `player`, team 
    WHERE player.team_id = team.team_id;
30. Write an SQL query to display tournament name with organizer name.
31. Write an SQL query to display match information with venue name.
    SELECT m.match_id, m.tournament_id, m.winner_team_id, v.venue_name
    FROM `matchinfo` m
    JOIN venue v ON m.venue_id = v.venue_id; 
32. Write an SQL query to display team names participating in each match.
    SELECT t.team_name, m.match_id FROM `matchinfo` m 
    JOIN team t ON m.team1_id = t.team_id OR m.team2_id = t.team_id;
    --ON t.team_id IN (m.team1_id, m.team2_id);
33. Write an SQL query to display winner team of each match.
    --without join
    SELECT m.match_id, t.team_name FROM `matchinfo` m, team t
    WHERE m.winner_team_id = t.team_id
    ORDER BY m.match_id ASC; 

    --with join
    SELECT m.match_id, t.team_name FROM `matchinfo` m
    JOIN team t ON m.winner_team_id = t.team_id
    ORDER BY m.match_id ASC; 
34. Write an SQL query to display player name, team name, and tournament name.
    SELECT p.player_name, tm.team_name, tt.tournament_name FROM `player` p 
    JOIN team tm ON p.team_id = tm.team_id
    JOIN tournament tt ON tm.tournament_id = tt.tournament_id;
35. Write an SQL query to display match ID, venue name, and match date.
    SELECT m.match_id, v.venue_name, m.match_date 
    FROM `matchinfo` m 
    JOIN  venue v on m.venue_id = v.venue_id; 
36. Write an SQL query to display umpire names assigned to each match.
    SELECT u.umpire_name, mu.match_id FROM `match_umpire` mu 
    JOIN umpire u ON mu.umpire_id = u.umpire_id
    ORDER BY mu.match_id; 
37. Write an SQL query to display scorecard with player name.
    SELECT p.player_name, s.runs, s.balls, s.wickets, s.overs FROM `player` p 
    RIGHT JOIN scorecard s ON p.player_id = s.player_id;
38. Write an SQL query to display points table with team name.
    SELECT t.team_name, p.matches_played, p.won, p.lost, p.points FROM `points_table` p 
    JOIN team t ON p.team_id = t.team_id; 
39. (**)Write an SQL query to display all players participating in Premier Cup.
    --first approach
    SELECT player_name FROM `player` p 
    WHERE team_id IN (SELECT team1_id FROM `matchinfo`
    WHERE tournament_id = (SELECT tournament_id FROM `tournament` WHERE tournament_name = "Premier Cup"))
    OR team_id IN (SELECT team2_id FROM `matchinfo`
    WHERE tournament_id = (SELECT tournament_id FROM `tournament` WHERE tournament_name = "Premier Cup")); 
    --using join
    SELECT p.player_name, t.team_name FROM `player` p 
    JOIN team t ON p.team_id = t.team_id
    JOIN tournament tt ON t.tournament_id = tt.tournament_id
    WHERE tt.tournament_name = "Premier Cup"; 
40. Write an SQL query to display all matches of Premier Cup.
    SELECT m.match_id FROM `matchinfo` m 
    JOIN tournament t ON m.tournament_id = t.tournament_id;
41. Write an SQL query to display all teams managed by organizer BCB.
    SELECT t.team_id, t.team_name FROM `organizer` o 
    JOIN tournament tt ON o.organizer_id = tt.organizer_id
    JOIN team t ON tt.tournament_id = t.tournament_id
    WHERE o.organizer_name = "BCB"; 
42. Write an SQL query to display all players of team Tigers.
    SELECT p.player_name FROM `player` p 
    JOIN team t ON p.team_id = t.team_id
    WHERE t.team_name = "Tigers"; 
43. Write an SQL query to display the venue of the final match.
    SELECT * FROM `matchinfo` m 
    JOIN venue v ON m.venue_id = v.venue_id
    WHERE m.round_type = "Final"; 
44. Write an SQL query to display all umpires assigned to semi-final matches.
    SELECT u.umpire_name, m.round_type FROM `matchinfo` m 
    JOIN match_umpire mu ON m.match_id = mu.match_id
    JOIN umpire u ON mu.umpire_id = u.umpire_id
    WHERE m.round_type = "Semi Final"; 
45. Write an SQL query to display all players who played in the final match.

--Sub queries
46. Write an SQL query to display players belonging to team Tigers using subquery.
47. Write an SQL query to display the venue having maximum capacity.
48. Write an SQL query to display the player who scored the highest runs.
49. Write an SQL query to display the team having the highest points.
50. Write an SQL query to display tournaments organized by the organizer having ID = 1.
51. Write an SQL query to display players whose runs are above average.
52. Write an SQL query to display matches played in the largest stadium.

--Advanced Level
53. Write an SQL query to display the top 3 run scorers.
54. Write an SQL query to display the team that won the maximum number of matches.
55. Write an SQL query to display the team eliminated in quarter-final matches.
56. Write an SQL query to display all undefeated teams.
57. Write an SQL query to display teams that reached the final.
58. Write an SQL query to display players who scored more than 50 runs.
59. Write an SQL query to display the most experienced umpire.
60. Write an SQL query to display the tournament champion.
61. Write an SQL query to calculate the win percentage of each team.
62. Write an SQL query to display the player with the highest total runs.
63. Write an SQL query to display teams that played more than 3 matches.
64. Write an SQL query to display matches where the winning margin exceeded a specified value.
65. Write an SQL query to rank teams based on points.

---------------------------