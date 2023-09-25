1) Soit le modèle relationnel suivant relatif à la gestion des notes annuelles d'une promotion
d'étudiants :
ETUDIANT (ID_ETUDIANT, NOM, PRENOM)
MATIERE (CODEMAT, LIBELLEMAT, COEFFMAT)
EVALUER (ID_EVALUER, DATE, NOTE, #ETUDIANT_ID, #CODEMAT)
Affichez les résultats suivants avec une solution SQL :
a) Quel est le nombre total d'étudiants ?
b) Quelles sont, parmi l'ensemble des notes, la note la plus haute et la note la plus basse ?
c) Quelles sont les moyennes de chaque étudiant dans chacune des matières ? (utilisez
CREATE VIEW)
d) Quelles sont les moyennes par matière ? (cf. question c)
e) Quelle est la moyenne générale de chaque étudiant ? (utilisez CREATE VIEW + cf. question
3)
f) Quelle est la moyenne générale de la promotion ? (cf. question e)
g) Quels sont les étudiants qui ont une moyenne générale supérieure ou égale à la moyenne
générale de la promotion ? (cf. question e)

//a)Quel est le nombre total d'étudiants ?
SELECT COUNT("id_etudiant") FROM etudiant

//b)Quelles sont, parmi l'ensemble des notes, la note la plus haute et la note la plus basse ?
SELECT MAX(note) FROM evaluer
UNION
SELECT MIN(note) FROM evaluer

//c)Quelles sont les moyennes de chaque étudiant dans chacune des matières ? (utilisez CREATE VIEW) (Obsolete ? Utilisation de join ?)
CREATE VIEW recap AS
SELECT 
	e.nom,
	m.libelleMat,
	AVG(ev.note) AS moyenne_note
FROM
	evaluer ev
	INNER JOIN etudiant e
		ON ev.id_etudiant = e.id_etudiant
	INNER JOIN matiere m
		ON ev.matiere_id = m.id_matiere
GROUP BY e.nom, m.libelleMat

//Puis
SELECT * FROM recap;

//d)Quelles sont les moyennes par matière ? (cf. question c)
SELECT libelleMat, AVG(moyenne_note) AS moyenne_matiere FROM recap
GROUP BY libelleMat

//e) Quelle est la moyenne générale de chaque étudiant ? (utilisez CREATE VIEW + cf. question 3)
CREATE VIEW recap2 AS
SELECT nom, AVG(moyenne_note) AS moyenne_etudiant FROM recap
GROUP BY nom

//f)Quelle est la moyenne générale de la promotion ?
SELECT  AVG(moyenne_etudiant) AS moyenne_promotion FROM recap2

//g)Quels sont les étudiants qui ont une moyenne générale supérieure ou égale à la moyenne générale de la promotion ? (cf. question e)
SELECT nom FROM recap2
WHERE moyenne_etudiant >= (SELECT AVG(moyenne_etudiant) FROM recap2);





