# Provisionnement et Déploiement d'Odoo sur AWS avec Terraform et Ansible

# Cas Pratique : Migration d'Infrastructure avec Terraform et Ansible

## Contexte

La Direction des Systèmes d'Information (DSI) de l'entreprise Proven-FR, basée en France, souhaite migrer son infrastructure pour tirer parti des avantages du cloud. Par le passé, l'entreprise a rencontré des difficultés lors de la mise en production de ses diverses applications en raison de l'absence de pratiques DevOps et du manque de concepts tels que l'Infrastructure as Code.

Le département d'innovation désire révolutionner l'infrastructure existante afin de garantir qu'elle soit évolutive, facilement déployable et maximisée en termes d'automatisation. 

Proven-FR a besoin d'un Ingénieur DevOps pour construire un **Proof of Concept (POC)** démontrant comment Terraform, couplé à Ansible, peut les aider à automatiser le provisionnement de leur infrastructure sur aws ainsi que les mises en production des applications de l'entreprise.

## Applications

Actuellement, Proven-FR possède deux applications dans sa ferme logicielle :
1. **Site Web Vitrine** de l'entreprise
2. **Logiciel de Gestion Intégré (ERP)** : Odoo, version 16

Ces deux applications fonctionnent Actuellement sur un serveur, et le département d'innovation souhaite les migrer vers le cloud AWS.

## Objectif du Projet

Votre rôle en tant que Ingénieur DevOps sera de :
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

## configuration de son environnement pour communiquer avec aws:
### Récupération de la Clé d'Accès AWS

Pour communiquer avec AWS et effectuer des actions programmatiques, vous devez récupérer vos **clés d'accès**. Ces clés sont essentielles pour authentifier vos requêtes API vers AWS. Voici comment procéder :

1. **Connectez-vous à la console AWS** :
   - Allez sur [AWS Management Console](https://aws.amazon.com/console/).
   - Connectez-vous avec vos identifiants.

2. **Accédez à la section IAM** :
   - Dans la console, recherchez et sélectionnez **IAM** (Identity and Access Management).
    ![image](https://github.com/user-attachments/assets/48c65c02-3854-4e5e-90fe-fd641ba6d133)

3. **Gérez les utilisateurs** :
   - Cliquez sur **Users** dans le volet de navigation.
   - Sélectionnez l'utilisateur pour lequel vous souhaitez créer des clés d'accès. Si vous n'avez pas encore d'utilisateur, créez-en un.
      ![image](https://github.com/user-attachments/assets/b2670833-e95a-4d8f-a317-773425bd411c)

4. **Créer des clés d'accès** :
   - Dans l'onglet **Security credentials**, faites défiler vers le bas jusqu'à la section **Access keys**.
   - Cliquez sur **Create access key**.
   - Une nouvelle clé d'accès sera générée. Notez bien la **Access Key ID** et la **Secret Access Key**. 
  ![image](https://github.com/user-attachments/assets/7b502b0d-bd2e-4227-af26-b7ecbc335e60)


   > **Important** : Conservez ces informations en lieu sûr. Vous ne pourrez pas récupérer la **Secret Access Key** après avoir quitté la page.

5. **Configurer votre environnement** :
   - Vous pouvez configurer vos clés d'accès dans votre environnement local en utilisant AWS CLI ou directement dans votre code Terraform.
   - sur votre terminale :
   ```bash
   export AWS_ACCESS_KEY_ID=
   export AWS_SECRET_ACCESS_KEY=```

#### Exemples de configuration avec AWS CLI

Vous pouvez configurer vos clés d'accès en utilisant la commande suivante :***aws configure***


## Récupération de la Paire de Clés SSH

Pour se connecter à vos instances EC2 par SSH, vous devez créer et télécharger une **paire de clés SSH**. Voici les étapes à suivre :

1. **Connectez-vous à la console AWS** :
   - Rendez-vous sur [AWS Management Console].
   - Connectez-vous avec vos identifiants.

2. **Accédez à la section EC2** :
   - Dans la console, recherchez et sélectionnez **EC2**.

3. **Créer une paire de clés** :
   - Dans le volet de navigation, cliquez sur **Key Pairs** sous la section **Network & Security**.
   - Cliquez sur le bouton **Create key pair**.
   - Donnez un nom à votre paire de clés (par exemple, `my-key-pair`).

4. **Télécharger la clé** :
   - Choisissez le format de fichier (`.pem` pour Linux/Mac ou `.ppk` pour Windows avec PuTTY).
   - Cliquez sur **Create** pour générer votre paire de clés.
   - Le fichier de clé privée sera automatiquement téléchargé. **Conservez-le en lieu sûr**, car vous ne pourrez pas le récupérer plus tard.

5. **Configurer les permissions de la clé** (pour Linux/Mac) :
   - Ouvrez un terminal et exécutez la commande suivante pour restreindre l'accès à votre clé :
   ```bash
   chmod 400 /path/to/your/my-key-pair.pem
   
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
### Resultats
![image](https://github.com/user-attachments/assets/cfb1c4e5-71f0-4f09-8b8f-5ff02d10968c)
![image](https://github.com/user-attachments/assets/7eb00e16-62cc-418b-aeb4-b19ac2d7d62d)


#### verification installation docker sur notre ec2 aws 
![image](https://github.com/user-attachments/assets/3d878e1b-e2ab-42ed-a3c9-aa34534b1dcc)
#### verification disponibilité du site de l'entreprise
![image](https://github.com/user-attachments/assets/d813f452-62b4-41d1-9154-1fa10394ea42)
#### verification disponibilité du odoo de l'entreprise
![image](https://github.com/user-attachments/assets/c37ab003-82ca-432d-8047-05e8fa2bb73a)
![image](https://github.com/user-attachments/assets/57163248-657a-4816-a792-2d6d53eb62db)
![image](https://github.com/user-attachments/assets/b42645b1-62f2-46e5-9a7d-d7a794700255)




## Conclusion
Ce projet vous permet de déployer facilement Odoo sur AWS tout en utilisant les meilleures pratiques de gestion de code avec Terraform et Ansible. Assurez-vous de suivre les instructions ci-dessus pour une configuration réussie.
