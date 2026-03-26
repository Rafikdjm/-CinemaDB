import pymysql

try:
    connexion = pymysql.connect(
        host="localhost",
        user="root",
        password="RafikDM@06",
        database="CinemaDB"
    )

    curseur = connexion.cursor()

    # Afficher tous les acteurs
    print("--- Acteurs ---")
    curseur.execute("SELECT * FROM acteur")
    for ligne in curseur.fetchall():
        print(ligne)

    # Afficher tous les films
    print("\n--- Films ---")
    curseur.execute("SELECT * FROM film")
    for ligne in curseur.fetchall():
        print(ligne)

    # Afficher les liaisons avec jointure
    print("\n--- Acteurs et leurs films ---")
    curseur.execute("""
        SELECT acteur.prenom, acteur.nom, film.titre
        FROM acteur, film, acteur_joue_film
        WHERE acteur.id_acteur = acteur_joue_film.id_acteur
        AND film.id_film = acteur_joue_film.id_film
    """)
    for ligne in curseur.fetchall():
        print(f"{ligne[0]} {ligne[1]} a joué dans {ligne[2]}")

    curseur.close()
    connexion.close()

except pymysql.Error as e:
    print(f"Erreur MySQL : {e}")

except Exception as e:
    print(f"Erreur : {e}")

finally:
    input("\nAppuie sur Entrée pour fermer...")