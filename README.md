# Provisionnement et Déploiement d'Odoo sur AWS avec Terraform et Ansible

## Introduction

Ce projet vise à provisionner des machines sur AWS en utilisant Terraform, puis à configurer et déployer l'application Odoo via Ansible.

## Architecture du Projet

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