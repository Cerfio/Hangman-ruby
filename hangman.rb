# coding: utf-8
# Project Pendu in ruby for coding club
# Epitech TEK-01
# Cerfio

#import le fichier qui contient les images
require_relative 'image.rb'

#prend un mot aleatoire dans le dictionnaire
def intro
  fichier = File.open("dictionnaire.txt",'r').readlines
  mot = fichier[rand(fichier.size)].downcase
  system("clear")
  puts("Bienvenue sur le jeu du pendu")
  return (mot)
end

#remplace les caracteres pardes '_' et la premiere lettre en Majuscule
def replace_character
  mot_trouver = intro()
  mot_afficher = ""
  nombre_caractere = mot_trouver.length
  nombre_caractere_2 = mot_trouver.length
  i = 0
  i_2 = 0
  while (i != nombre_caractere - 1)
    i = i + 1
    mot_afficher += '_'
  end
  #cette boucle sert si la 1er lettre est présente plusieurs fois dans le mot
  while (i_2 != nombre_caractere_2)
    if (mot_trouver[0] == mot_trouver[i_2])
      mot_afficher[i_2] = mot_trouver[0]
    end
    i_2 = i_2 + 1
  end
  mot_afficher[0] = mot_trouver[0].upcase
  puts(mot_afficher)
  boucle(mot_afficher,nombre_caractere,mot_trouver)
end

#Continue tant que le mot n'a pas été trouver 
def boucle(mot_afficher,nombre_caractere,mot_trouver)
  i = 0
  vie = 10
  validation = 0
  while (vie != 0)
    puts("veuillez inserer une lettre")
    #appelle la fonction qui contient les images
    image_display(vie)
    lettre = gets.chomp.downcase
    while (i != nombre_caractere)
      if (lettre == mot_trouver[i])
        validation = 1
        mot_afficher[i] = mot_trouver[i]
      end
      i = i + 1
    end
    system("clear")
    if (validation == 0)
      puts("nop, try again")
      vie = vie - 1
    end
    victoire(mot_afficher,nombre_caractere)
    mot_afficher[0] = mot_trouver[0].upcase
    puts(mot_afficher)
    validation = 0
    i = 0
    print"vie = "
    puts vie
  end
  defaite(vie,mot_trouver)
end

#pas besoin d'explication
def defaite(vie,mot_trouver)
  puts("LOSE")
  image_display(vie)
  puts("le mot etait " + mot_trouver)
  replay()
end

#pas besoin d'explication
def victoire(mot_afficher,nombre_caractere)
  i = 0
  while (i != nombre_caractere)
    if (mot_afficher[i] == "_")
      return 0
    end
    i = i + 1
  end
  puts(mot_afficher)
  puts("VICTOIRE")
  replay()
end

#Pour restart une game
def replay()
  puts("Voulez vous rejouez")
  puts("1) JOUER")
  puts("2) EXIT")
  answer = gets.chomp
  if (answer == '1')
    replace_character()
    system("clear")
  else
    system("clear")
    exit
  end
end

#fonction main language C ^^
replace_character()
