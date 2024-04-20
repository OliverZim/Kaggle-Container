# Kaggle Container
## Motivation
Data Science projects typically use a lot of libraries to accomplish their goals. Managing all of these dependencies can become cumbersome. In addition to this, they can require quite a lot of computational resources. The goal of this template is to provide an easy to use, reproducible environment to use for Kaggle competitions and Data Science projects in general. It allows the user to develop python scripts and jupyter notebooks locally with features like code completion, intellisense and also the ability for debugging code. Afterwards, it simplifies the process of pushing the created project to the Kaggle platform to publish them or run them with GPU support.

## Setup
### VS Code
This template relies on the VS Code devcontainer technology. Therefore, you will need to use VS Code for development. Other IDEs and editors might work as well, but we did not test them.

### Docker
This template relies on Docker in order to be portable and to facilitate a reproducible development environment. Therefore, you need to have Docker installed. More information regarding Docker and its installation process can be found [here](https://docs.docker.com/get-docker/). 

This setup relies on a Docker image for data analysis and ml tasks that run on CPU which is provided by Kaggle itself. This setup can be pulled by running the command ```docker pull gcr.io/kaggle-images/python``` (**Note:** because the image already includes all the common dependencies for data science and ml tasks it is quite big. It might take up disk space of around 20gb). In case you want to use GPU acceleration already in local development you will have to use another image ```docker pull gcr.io/kaggle-gpu-images/python```. I only recommend to use this image when you are planning to use GPU acceleration locally. 

### Kaggle authentication
Although you can technically use this template for any of your own projects, the intended use-case for it is to accelerate your experimentation in Kaggle challenges. In order to participate in such challenges or to contribute by providing your own datasets and ml models, you will need to create an account on Kaggle. This can be done [here](https://www.kaggle.com/). 
In order to use the Kaggle CLI you will also have to create an access token. The process for this is described in all detail [here](https://www.kaggle.com/docs/api#getting-started-installation-&-authentication). This will create a ```kaggle.json``` file which contains your username and key. To enable all the automatic tasks this container offers create a file named ```.env``` in the ```.devcontainer``` directory and add the following to lines to it:
```
KAGGLE_USERNAME=INSERT_USERNAME_HERE
KAGGLE_KEY=INSERT_KEY_HERE
```
Make sure to replace the placeholders with your actual values. The .env file is excluded from version control by default so you do not have to worry about leaking private information.

### Version Control
Another advantage that local development offers is the possibility for version control. In order to have version control properly configured you will need to change your name and email in [./devcontainer/config-git.sh](.devcontainer/config-git.sh).

## Usage
This template is supposed to help you with the participation in Kaggle challenges. For this we will describe a simple workflow on how to participate in a competition.

### Start the container
After you completed the setup you can run your container and develop in an isolated environment. To do so hit ```Ctrl-Shift-P``` and type ```Reopen in Container```. Now simply execute the corresponding task and if your setup was correct this should now bring you to the container itself.

### Registering for a competition
First of all, you will have to find a competition that you find interesting and that you want to participate in. All of the competitions are listed [here](https://www.kaggle.com/competitions). Once you found such a competition and it is still running, you can join it and are ready to go!

### Get the data
For basically every competition there is at least training data provided which you can use to develop your methods. To get the data you will need to find the competition name. You can do so by viewing the data tab of the competition and scrolling to the very bottom. There you should find something like this ```kaggle competitions download -c challenge-name```. Once you got the challenge name you can run the task ```kaggle: competition - download```. All tasks can be executed with ```Ctrl-Shift-P -> Tasks: Run Task```.
This will download the data of the challenge into the input directory (typically the directory will be compressed). 

### Work with the data
Next up for you is the experimentation phase. Write code, run experiments, see experiments, repeat and improve. You can put all your scripts and notebooks in the ```code``` directory. In your code make sure to access the input directory with the mounted path ```/input```. Now its your time to have fun and get creative. Once you need to save files (e.g model outputs) you can save them to the ```working``` directory mounted at ```/working```.
**Note:** In case you want to use different training logic in your locally executed code than the one running on the Kaggle platform you can use the ```DEVELOPMENT_MODE``` environment variable. I guide on how to do this and why it can be useful can be found [here](/code/README.md)

### Use Kaggles platform to run computationally intensive tasks (or: How to publish notebooks)
We all know that data science and ml projects can get resource intensive fast. But this does not have to stop you from achieving good results as Kaggle provides free access to computationally resources to all of its users for free (see this [link](https://www.kaggle.com/docs/notebooks#modifying-a-notebook-specific-environment) for more information). In order to use these resources you can push your code to the Kaggle platform and have it be executed there. 
The steps for this are the following:
1. Run the task ```kaggle: notebook - add metadata```. This should generate a file ```kernel-metadata.json``` like the following:
```
{
  "id": "username/INSERT_KERNEL_SLUG_HERE",
  "title": "INSERT_TITLE_HERE",
  "code_file": "INSERT_CODE_FILE_PATH_HERE",
  "language": "Pick one of: {python,r,rmarkdown}",
  "kernel_type": "Pick one of: {script,notebook}",
  "is_private": "true",
  "enable_gpu": "false",
  "enable_tpu": "false",
  "enable_internet": "true",
  "dataset_sources": [],
  "competition_sources": [],
  "kernel_sources": [],
  "model_sources": []
}
``` 
Now you just need to fill in the required fields (e.g. insert the competition name in case you are using the dataset of a competition). If you want to use GPU acceleration also make sure to set the entry to "true".
2. After filling in the fields simply run the task ```kaggle: notebook - push to remote``` Your notebook should now be pushed to the Kaggle platform and execute there automatically. 
3. Now you can make changes to your code and once you want to publish the results simply repeat step 2. 

### Submit your results
Once you are happy with your work you can submit your results. You can push files you generated locally with the task ```kaggle: competition - submit solution```. Another option would be to submit the files from the notebook editor on the kaggle platform.