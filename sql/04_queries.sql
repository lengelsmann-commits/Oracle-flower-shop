-- question a 

select count(*) from commande
where datepaiement like '__/__/21';

-- question b

select CodePostal, 
(select count(*) from commande where CodePostal = Livraison.CodePostal) as nb_cmd
from Livraison
order by nb_cmd desc 
fetch first 3 rows only;

-- question c

-- option 1
SELECT NomFleur, TotalFleurs
FROM (
    SELECT fc.NomFleur,
           SUM(fc.NbrFleurs) AS TotalFleurs
    FROM Commande c
    JOIN Bouquet b
        ON c.NumCommande = b.NumCommande
    JOIN FleurContenue fc
        ON b.NumBouquet = fc.NumBouquet
    WHERE EXTRACT(YEAR FROM c.DateCommande) = 2021
    GROUP BY fc.NomFleur
    ORDER BY TotalFleurs DESC
)
WHERE ROWNUM = 1;

-- option 2
Select nomfleur, sum(nbrfleurs) as totalfleurs from historiqueachat where dateachat like'__/__/21'
group by nomfleur
order by totalfleurs desc
fetch first rows only;

-- question d
SELECT ROUND(AVG(nb_bouquets_client), 2) AS moyenne_bouquets_par_client
FROM (
    SELECT c.Email,
           SUM(b.NbrBouquets) AS nb_bouquets_client
    FROM Clients c
    JOIN Commande co ON co.Email = c.Email
    JOIN Bouquet b ON b.NumCommande = co.NumCommande
    GROUP BY c.Email
);

-- question e
SELECT f.NomFleur
FROM Fleur f
WHERE NOT EXISTS (
    SELECT 1
    FROM FleurContenue fc
    WHERE fc.NomFleur = f.NomFleur
);

-- question f
SELECT c.Email,
       fc.NomFleur,
       SUM(fc.NbrFleurs * b.NbrBouquets) AS total_fleurs
FROM Clients c
JOIN Commande co ON co.Email = c.Email
JOIN Bouquet b ON b.NumCommande = co.NumCommande
JOIN FleurContenue fc ON fc.NumBouquet = b.NumBouquet
GROUP BY c.Email, fc.NomFleur
HAVING SUM(fc.NbrFleurs * b.NbrBouquets) >= ALL (
    SELECT SUM(fc2.NbrFleurs * b2.NbrBouquets)
    FROM Commande co2
    JOIN Bouquet b2 ON b2.NumCommande = co2.NumCommande
    JOIN FleurContenue fc2 ON fc2.NumBouquet = b2.NumBouquet
    WHERE co2.Email = c.Email
    GROUP BY fc2.NomFleur
);

-- question g
SELECT
    co.NumCommande,
    co.DateCommande,
    c.Nom AS NomClient,
    (
        SUM(fc.NbrFleurs * b.NbrBouquets * f.TarifFleur)
        + l.TarifLivraison
    ) AS MontantCommande
FROM Commande co
JOIN Clients c ON c.Email = co.Email
JOIN Livraison l ON l.CodePostal = co.CodePostal
JOIN Bouquet b ON b.NumCommande = co.NumCommande
JOIN FleurContenue fc ON fc.NumBouquet = b.NumBouquet
JOIN Fleur f ON f.NomFleur = fc.NomFleur
GROUP BY
    co.NumCommande,
    co.DateCommande,
    c.Nom,
    l.TarifLivraison
ORDER BY co.DateCommande;

-- question h
SELECT c.Nom
FROM Clients c
JOIN Commande co ON co.Email = c.Email
JOIN Bouquet b ON b.NumCommande = co.NumCommande
JOIN FleurContenue fc ON fc.NumBouquet = b.NumBouquet
JOIN Fleur f ON f.NomFleur = fc.NomFleur
WHERE co.CodePostal IS NULL
GROUP BY c.Nom, co.NumCommande
ORDER BY SUM(f.TarifFleur * fc.NbrFleurs * b.NumBouquet) DESC
fetch first 1 rows only;

-- question i
SELECT c.Nom
FROM Clients c
JOIN Commande co ON co.Email = c.Email
JOIN Bouquet b ON b.NumCommande = co.NumCommande
JOIN FleurContenue fc ON fc.NumBouquet = b.NumBouquet
JOIN Fleur f ON f.NomFleur = fc.NomFleur
LEFT JOIN Livraison l ON co.CodePostal = l.CodePostal
GROUP BY c.Nom, co.NumCommande, l.TarifLivraison
ORDER BY (SUM(f.TarifFleur * fc.NbrFleurs * b.NumBouquet) + l.TarifLivraison) DESC
fetch first 1 rows only;
