-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Mf3HSr
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "leagues" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    CONSTRAINT "pk_leagues" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "teams" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "city" text   NOT NULL,
    CONSTRAINT "pk_teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "referees" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "matches" (
    "id" int   NOT NULL,
    "location" text   NOT NULL,
    "date_time" timestamp   NOT NULL,
    "team1_id" int   NOT NULL,
    "team2_id" int   NOT NULL,
    "leagueid" int   NOT NULL,
    "referee_1_id" int   NOT NULL,
    "referee_2_id" int   NOT NULL,
    "referee_3_id" int   NOT NULL,
    CONSTRAINT "pk_matches" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "players" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "teamid" int   NOT NULL,
    CONSTRAINT "pk_players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "goals" (
    "id" int   NOT NULL,
    "playerid" int   NOT NULL,
    "matchid" int   NOT NULL,
    CONSTRAINT "pk_goals" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "rankings" (
    "id" int   NOT NULL,
    "matchid" int   NOT NULL,
    "teamid" int   NOT NULL,
    "won" boolean   NOT NULL,
    CONSTRAINT "pk_rankings" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "player-match" (
    "id" int   NOT NULL,
    "playerid" int   NOT NULL,
    "matchid" int   NOT NULL,
    CONSTRAINT "pk_player-match" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_team1_id" FOREIGN KEY("team1_id")
REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_team2_id" FOREIGN KEY("team2_id")
REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_leagueid" FOREIGN KEY("leagueid")
REFERENCES "leagues" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_referee_1_id" FOREIGN KEY("referee_1_id")
REFERENCES "referees" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_referee_2_id" FOREIGN KEY("referee_2_id")
REFERENCES "referees" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_referee_3_id" FOREIGN KEY("referee_3_id")
REFERENCES "referees" ("id");

ALTER TABLE "players" ADD CONSTRAINT "fk_players_teamid" FOREIGN KEY("teamid")
REFERENCES "teams" ("id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_playerid" FOREIGN KEY("playerid")
REFERENCES "players" ("id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_matchid" FOREIGN KEY("matchid")
REFERENCES "matches" ("id");

ALTER TABLE "rankings" ADD CONSTRAINT "fk_rankings_matchid" FOREIGN KEY("matchid")
REFERENCES "matches" ("id");

ALTER TABLE "rankings" ADD CONSTRAINT "fk_rankings_teamid" FOREIGN KEY("teamid")
REFERENCES "teams" ("id");

ALTER TABLE "player-match" ADD CONSTRAINT "fk_player-match_playerid" FOREIGN KEY("playerid")
REFERENCES "players" ("id");

ALTER TABLE "player-match" ADD CONSTRAINT "fk_player-match_matchid" FOREIGN KEY("matchid")
REFERENCES "matches" ("id");

