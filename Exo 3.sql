1) Soit le schéma relationnel suivant :
ARTICLES (NOART, LIBELLE, STOCK, PRIXINVENT)
FOURNISSEURS (NOFOUR, NOMFOUR, ADRFOUR, VILLEFOUR)
ACHETER (NOFOUR#, NOART#, PRIXACHAT, DELAI)
Affichez les résultats suivants avec une solution SQL :
a) Numéros et libellés des articles dont le stock est inférieur à 10 ?
b) Liste des articles dont le prix d'inventaire est compris entre 100 et 300 ?
c) Liste des fournisseurs dont on ne connaît pas l'adresse ?
d) Liste des fournisseurs dont le nom commence par "STE" ?
e) Noms et adresses des fournisseurs qui proposent des articles pour lesquels le délai d'approvisionnement est supérieur à 20 jours ?
f) Nombre d'articles référencés ?
g) Valeur du stock ?
h) Numéros et libellés des articles triés dans l'ordre décroissant des stocks ?
i) Liste pour chaque article (numéro et libellé) du prix d'achat maximum, minimum et moyen ?
j) Délai moyen pour chaque fournisseur proposant au moins 2 articles ?

//a) Numéros et libellés des articles dont le stock est inférieur à 10 ?
SELECT noArt, libelle FROM article
WHERE stock < 10

//b) Liste des articles dont le prix d'inventaire est compris entre 100 et 300 ?
SELECT libelle FROM article
WHERE prixInvent between 100 AND 300

//c) Liste des fournisseurs dont on ne connaît pas l'adresse ?
SELECT nomFour FROM fournisseurs
WHERE adrFour IS NULL 

//d) Liste des fournisseurs dont le nom commence par "STE" ?
SELECT nomFour FROM fournisseurs
WHERE nomFour LIKE "STE%"

//e) Noms et adresses des fournisseurs qui proposent des articles pour lesquels le délai d'approvisionnement est supérieur à 20 jours ?
SELECT nomFour, adrFour 
FROM acheter a
INNER JOIN article art
	ON a.`noArt#`= art.noArt
INNER JOIN fournisseurs f
	ON a.`noFour#`= f.noFour
WHERE delai > 20

//f)Nombre d'articles référencés ?
SELECT COUNT(libelle) FROM article

//g) Valeur du stock ?

//h) Numéros et libellés des articles triés dans l'ordre décroissant des stocks ?
SELECT noArt, libelle FROM article
ORDER BY stock desc

//i) Liste pour chaque article (numéro et libellé) du prix d'achat maximum, minimum et moyen ?
SELECT 
    art.noArt, 
    art.libelle,
    MIN(a.prixAchat) AS minPrixAchat,
    MAX(a.prixAchat) AS maxPrixAchat,
    AVG(a.prixAchat) AS avgPrixAchat
FROM 
    article art
INNER JOIN 
    acheter a ON a.`noArt#` = art.noArt
GROUP BY 
    art.noArt, art.libelle;

//j) Délai moyen pour chaque fournisseur proposant au moins 2 articles ?
SELECT f.nomFour, AVG(a.delai) 
FROM acheter a
INNER JOIN article art
	ON a.`noArt#`= art.noArt
INNER JOIN fournisseurs f
	ON a.`noFour#`= f.noFour
GROUP BY nomFour
HAVING COUNT(a.`noArt#`) >= 2