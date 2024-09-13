Mini Projet Ansible Vault
=========
Ce mini projet a pour objectif de mettre en pratique les bonnes pratiques d'Ansible dans un projet. Nous allons déployer un site web statique sur deux serveurs : développement et production. Les mots de passe pour chaque environnement sont stockés de manière sécurisée grâce à Ansible Vault.

Dans ce projet, vous trouverez les éléments suivants :
------------
- inventory.yml : fichier d'inventaire contenant la description des hôtes de nos serveurs. Nous avons deux groupes : dev et prod.
-  ansible.cfg : fichier de configuration d'Ansible permettant de spécifier des paramètres tels que le chemin des rôles, de l'inventaire et la désactivation de la vérification des connexions SSH.
- Dossiers group_vars et host_vars : contiennent respectivement les variables de groupe et les variables spécifiques aux hôtes.
- Dossier roles : contient les rôles utilisés dans le projet.
- Fichier files/secrets/credentials.yml : contient toutes les informations sensibles de nos serveurs, telles que ansible_user, ansible_password et ansible_host. Ce fichier est sécurisé grâce à Ansible Vault pour garantir la confidentialité de ces informations.

### N'hésitez pas à explorer le projet pour découvrir les bonnes pratiques d'Ansible mises en œuvre 
