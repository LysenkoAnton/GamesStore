use GameStore
GO
IF NOT EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME='Products' AND xtype='U')
CREATE TABLE Products
(
	[GameID] INT NOT NULL PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(100) NOT NULL,
	[Description] NVARCHAR(500) NOT NULL,
	[Category] NVARCHAR(50) NOT NULL,
	[Price] DECIMAL(16, 2) NOT NULL
)
GO
use Products
GO
IF NOT EXISTS(SELECT * FROM Products)
INSERT INTO Games (Name, Description, Category, Price)
VALUES
('SimCity', 'Urban simulator again with you! Create the city of your dreams', 'Simulator', 1499.00),
('TITANFALL', 'This game will take you to the universe, where the small is opposed to the big, nature is the industry, and man is the machine', 'Shooter', 2299.00),
('Battlefield 4', 'Battlefield 4 is the defining thriller for the genre, full of action, known for its destructibility, which has no equal', 'Shooter', 899.40),
('The Sims 4', 'In reality, each person can live only one life. But with the help of The Sims 4, this restriction can be removed!
It is up to you to decide where, how and with whom to live, what to do, what to decorate and equip your house.','Simulator', 15.00),
('Dark Souls 2', 'The continuation of the famous role-playing action will once again force the players to go through the most difficult trials. Dark Souls II will offer
new hero, a new story and a new world. Only one thing is invariable - to survive in the dark universe of Dark Souls is very difficult. ','RPG', 949.00),
('The Elder Scrolls V: Skyrim', 'After the assassination of the king of Skyrim, the empire was on the verge of disaster. New alliances rallied around the aspirants to the throne,
and the conflict flared up. In addition, as the ancient scrolls predicted, cruel and merciless dragons returned to the world. Now the future of Skyrim and the whole
the empire depends on the dragonborn - a person in whose veins the blood of legendary creatures flows. ','RPG', 1399.00),
('FIFA 14', 'Credible, beautiful, emotional football! The time-tested FIFA gameplay has become even better thanks to innovations that encourage creative play in
center of the field and allowing you to set its pace. ','Simulator', 699.00),
('Need for Speed ​​Rivals',' Forget about the standard game modes. Erase the line between single and multiplayer modes in constant rivalry
between the riders and the police. Feel free to enter a world in which your friends are already racing and chasing. ','Simulator', 15.00),
('Crysis 3', 'The game takes place in 2047, and you have to play the role of a prophet.', 'Shooter', 1299.00),
('Dead Space 3', 'In Dead Space 3, Isaac Clark and austere soldier John Carver set off on a space trip to learn about the origins of the necromorphs.', 'Shooter', 499.00);
