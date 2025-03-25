# Beev_StudyCase

# Beev - Cas pratique Data Engineering

Ce projet a été réalisé dans le cadre d’une étude de cas chez Beev, visant à centraliser, structurer et analyser des données issues de deux fichiers CSV (`cars` et `sales`) pour mieux comprendre les parts de marché automobiles dans différents pays
Il m’a permis de mettre en place un pipeline de données complet, depuis la modélisation de la base jusqu’à la visualisation des ventes de voitures.

---

## Objectif

Le but de ce projet était de :
- Concevoir une base de données capable de stocker les données de ventes automobiles par pays
- Nettoyer et intégrer deux fichiers CSV dans cette base
- Réaliser quelques analyses de qualité des données via des requêtes SQL
- Générer des visualisations claires à partir des données stockées


---

## Stack technique utilisée

- **PostgreSQL** (base de données relationnelle)
- **Docker** (virtualisation de la base)
- **Python** (`pandas`, `sqlalchemy`, `matplotlib`)
- **DBeaver** (exploration et requêtes SQL)
- **Git & GitHub** (versionning et dépôt)

---

## Hypothèses de départ sur le code

- Emplacement fichier: Le script Python est dans le même dossier que les csv, autrement on a besoin du chemin d'accès des csv pour les lire et extraire

- Marche pour une base de donnée dénomée poastgres avec le même user et mdp

## Défauts

- Risque de désynchro entre les tables car j'ai laissé des doublons, il y a donc de la redondance (Make/Brand,Country)

- Nettoyage pas complètement généralisé (mais facilement faisable à partir du code)

