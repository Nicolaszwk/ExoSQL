Donnez le résultat SQL des éléments suivants :
a) Liste de tous les étudiants
b) Liste de tous les étudiants, classée par ordre alphabétique inverse
c) Libellé et coefficient (exprimé en pourcentage) de chaque matière
d) Nom et prénom de chaque étudiant
e) Nom et prénom des étudiants domiciliés à Lyon
f) Liste des notes supérieures ou égales à 10
g) Liste des épreuves dont la date se situe entre le 1er janvier et le 30 juin 2014
h) Nom, prénom et ville des étudiants dont la ville contient la chaîne "ll" (LL)
i) Prénoms des étudiants de nom Dupont, Durand ou Martin
j) Somme des coefficients de toutes les matières
k) Nombre total d'épreuves
l) Nombre de notes indéterminées (NULL)
m) Liste des épreuves (numéro, date et lieu) incluant le libellé de la matière
n) Liste des notes en précisant pour chacune le nom et le prénom de l'étudiant qui l'a obtenue
o) Liste des notes en précisant pour chacune le nom et le prénom de l'étudiant qui l'a obtenue et le libellé de la matière concernée
p) Nom et prénom des étudiants qui ont obtenu au moins une note égale à 20
q) Moyennes des notes de chaque étudiant (indiquer le nom et le prénom)
r) Moyennes des notes de chaque étudiant (indiquer le nom et le prénom), classées de la meilleure à la moins bonne
s) Moyennes des notes pour les matières (indiquer le libellé) comportant plus d'une épreuve
t) Moyennes des notes obtenues aux épreuves (indiquer le numéro d'épreuve) où moins de 6 étudiants ont été notés


//a) Liste de tous les étudiants
SELECT * FROM etudiant

//b) Liste de tous les étudiants, classée par ordre alphabétique inverse
SELECT * FROM etu
ORDER BY nom desc

//c) Libellé et coefficient (exprimé en pourcentage) de chaque matière
SELECT libelle, (coeff/19*100) AS coeff_percentage FROM matière

//d) Nom et prénom de chaque étudiant
SELECT nom, prenom FROM etudiant

//e) Nom et prénom des étudiants domiciliés à Lyon
SELECT nom, prenom FROM etudiant
WHERE ville = "Lyon"

//f) Liste des notes supérieures ou égales à 10
SELECT note FROM notation
WHERE note >= 10

//g) Liste des épreuves dont la date se situe entre le 1er janvier et le 30 juin 2014
SELECT * FROM epreuve
WHERE datEpreuve BETWEEN "2014-01-01" AND "2014-06-30"

//h) Nom, prénom et ville des étudiants dont la ville contient la chaîne "ll" (LL)
SELECT nom, prenom, ville FROM etudiant
WHERE ville 
LIKE "%ll%"

//i) Prénoms des étudiants de nom Dupont, Durand ou Martin
SELECT prenom FROM etudiant
WHERE nom = "Martin"
OR   
nom = "Dupont" 
OR   
nom = "Durand"

//j) Somme des coefficients de toutes les matières
SELECT SUM(coeff) AS coeff_sum FROM matière

//k) Nombre total d'épreuves
SELECT COUNT(numepreuve) FROM epreuve

//l) Nombre de notes indéterminées (NULL)
SELECT note FROM notation
WHERE note IS NULL 

//m) Liste des épreuves (numéro, date et lieu) incluant le libellé de la matière
SELECT numepreuve, datEpreuve, lieu, libelle FROM epreuve e
INNER JOIN matière m
ON e.matiere_id = m.codemat

//o) Liste des notes en précisant pour chacune le nom et le prénom de l'étudiant qui l'a obtenue et le libellé de la matière concernée

//p) Nom et prénom des étudiants qui ont obtenu au moins une note égale à 20
SELECT nom, prenom FROM etudiant e
INNER JOIN notation n
ON n.etudiant_id = e.numetu
WHERE note >= "20"

//q) Moyennes des notes de chaque étudiant (indiquer le nom et le prénom)
SELECT nom, prenom, AVG(note) AS moyenne FROM etudiant e
INNER JOIN notation n
ON n.etudiant_id = e.numetu
GROUP BY nom

//r) Moyennes des notes de chaque étudiant (indiquer le nom et le prénom), classées de la meilleure à la moins bonne
SELECT nom, prenom, AVG(note) AS moyenne FROM etudiant e
INNER JOIN notation n
ON n.etudiant_id = e.numetu
GROUP BY nom
ORDER BY moyenne desc

//s) Moyennes des notes pour les matières (indiquer le libellé) comportant plus d'une épreuve
SELECT libelle, AVG(note) AS moyenne FROM epreuve e
INNER JOIN notation n
ON n.epreuve_id = e.numepreuve
INNER JOIN matière m
ON e.matiere_id = m.codemat
GROUP BY libelle
HAVING COUNT(matiere_id) > 1


t) Moyennes des notes obtenues aux épreuves (indiquer le numéro d'épreuve) où moins de 6 étudiants ont été notés
SELECT numepreuve, AVG(note) AS moyenne FROM epreuve e
INNER JOIN notation n
ON n.epreuve_id = e.numepreuve
GROUP BY numepreuve
HAVING COUNT(n.etudiant_id) > 6



