# Exploration cinématographique
&#x1F3A5; Bienvenue dans le projet d'exploration cinématographique ! &#x1F3A5; 

Une étude basée sur la visualisation de données &#128200; pour découvrir le dessous des films à succès &#11088;

L'équipe &#x1F680;
* Eloïse LAPLANCHE
* Laure PENG
* Gaudeline Maeva SIMO KAMWA
* Belvine YEMDJO YOUMBI

## Données

Nous avons choisi d’étudier un dataset regroupant des données sur les films à succès. Ce jeu de données a été trouvé sur kaggle et a été modifié par nos soins pour garder uniquement  les features qui nous importent dans cette étude.
Le choix de travailler sur des données liées au monde du cinéma résulte de l’envie de la part des membres de notre équipe de découvrir plus en détails cet univers. Toutes les quatre amatrices de films, ce jeu de données sera pour nous l’occasion de travailler sur un sujet qui nous intéresse et qui nous intrigue. 

* Nombre d’observations : 4803
* Nombre de variables : 17
* Source : https://www.kaggle.com/datasets/harshshinde8/movies-csv

Détail des données : 
| Variable                | Type     | Description                                |
|-------------------------|----------|--------------------------------------------|
| budget                  | `Int`    | Budget global pour réaliser le film        |
| genres                  | `String` | Genres associés au film                   |
| keywords                | `String` | Mots clés représentant le film             |
| overview                | `String` | Description donnant une aperçue du film    |
| popularity              | `Float`  | Popularité du film (entre 0 et 876)        |
| production_companies    | `String` | Liste des compagnies de productions        |
| production_countries    | `String` | Liste des pays de production               |
| release_date            | `Date`   | Date de sortie du film                     |
| revenue                 | `Int`    | Revenus générés par le film                |
| runtime                 | `Float`  | Durée du film en minutes                   |
| spoken_languages        | `String` | Liste des langues parlées dans le film     |
| tagline                 | `String` | “Slogan” du film                           |
| title                   | `String` | Titre du film                              |
| vote_average            | `Float`  | Moyenne de la note attribuée (entre 0 et 10)|
| vote_count              | `Int`    | Décompte du nombre de votes (entre 0 et 13752)|
| cast                    | `String` | Liste des noms des acteurs du film         |
| director                | `String` | Nom du réalisateur du film                 |

On peut relever dans ce dataset plusieurs grands groupes de données : 
* Les données de **description du film** (*genres, keywords, overview, tagline, title*)
* Les données concernant la **réalisation du film** (*director, cast, spoken_languages, runtime, release_date, production_countries, production_companies, budget*)
* Les données sur les **retombées du film** (*popularity, revenue, vote_average, vote_count*)


## Plan d'analyse


