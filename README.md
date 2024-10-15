# Provisionnement et Déploiement d'Odoo sur AWS avec Terraform et Ansible

# Cas Pratique : Migration d'Infrastructure avec Terraform et Ansible

## Contexte

La Direction des Systèmes d'Information (DSI) de l'entreprise Proven-FR, basée en France, souhaite migrer son infrastructure pour tirer parti des avantages du cloud. Par le passé, l'entreprise a rencontré des difficultés lors de la mise en production de ses diverses applications en raison de l'absence de pratiques DevOps et du manque de concepts tels que l'Infrastructure as Code.

Le département d'innovation désire révolutionner l'infrastructure existante afin de garantir qu'elle soit évolutive, facilement déployable et maximisée en termes d'automatisation. Proven-FR a besoin d'un DevOps pour construire un **Proof of Concept (POC)** démontrant comment Terraform, couplé à Ansible, peut les aider et prouver l'efficacité de ces deux technologies pour automatiser les mises en production des applications.

## Applications Concernées

Actuellement, Proven-FR possède deux applications dans sa ferme logicielle :
1. **Site Web Vitrine** de l'entreprise
2. **Logiciel de Gestion Intégré (ERP)** : Odoo, version 16

Ces deux applications fonctionnent sur un serveur, et le département d'innovation souhaite les migrer vers le cloud AWS.

## Objectif du Projet

Votre rôle en tant que DevOps sera de :
1. **Initier un projet Terraform-Ansible** divisé en deux parties :

### 1ère Partie : Provisionnement de l'Infrastructure sur AWS

Dans cette partie, vous devez utiliser la notion de **modules** sous Terraform pour mettre en place trois modules ayant pour objectif respectif :
- **Création d'une instance EC2**
- **Création d'un groupe de sécurité**
- **Attribution d'une Elastic IP**

Ces modules devront être conçus de manière à pouvoir être réutilisés dans d'autres projets si nécessaire.

### 2ème Partie : Déploiement des Applications avec Ansible

Cette partie consiste à mettre en place des **playbooks Ansible** pour faciliter le déploiement des applications sur les ressources créées précédemment.

#### Détails Techniques

- **Site Web Vitrine** : Utiliser une image Apache (version à spécifier).
- **ERP Odoo** : Utiliser la version 16 d'Odoo.

Les deux applications doivent être déployées sous forme de **rôles** dans Ansible.


Ce projet permettra non seulement de moderniser l'infrastructure de Proven-FR, mais aussi de démontrer l'efficacité de Terraform et Ansible pour automatiser les processus de déploiement. Ce cas pratique sera une excellente occasion d'appliquer vos compétences en DevOps.
## EXEMPLE DE SOLUTION

1. **Provisionnement avec Terraform**
    - **Modules Terraform** :
        - **Module EC2** : Création de l'instance EC2.
        - **Module EIP** : Création d'une adresse IP publique associée à l'instance EC2.
        - **Module SG** : Création d'un groupe de sécurité pour gérer les règles d'accès.
    - L'utilisation de modules facilite la maintenance et le partage de code.

2. **Configuration avec Ansible**
    - **Rôles Ansible** :
        - **Rôle Odoo** : Notre propre rôle pour l'installation d'Odoo.
        - **Rôle Docker** : Utilisation d'un rôle Ansible Galaxy pour installer Docker et Docker Compose sur la machine provisionnée.
    - Les informations sensibles sont sécurisées à l'aide d'Ansible Vault.

## Instructions de Déploiement

### Pour Terraform

1. Accédez au dossier `app/`.
2. Exécutez les commandes suivantes :
   ```bash
   terraform init
   terraform apply
3. Pour détruire l'environnement, utilisez:
    ```bash
   terraform destroy
   
### Pour Ansible
1. Accédez au dossier `ansible/`.
2. Exécutez les commandes suivantes :
   ```bash
   ansible-vault encrypt file
   ansible-galaxy install -r roles/requirement.yml
   ansible-playbook playbook.yml --ask-vault-pass

## Conclusion
Ce projet vous permet de déployer facilement Odoo sur AWS tout en utilisant les meilleures pratiques de gestion de code avec Terraform et Ansible. Assurez-vous de suivre les instructions ci-dessus pour une configuration réussie.