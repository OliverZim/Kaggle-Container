This folder contains the source code files of the project. It is advised to access input data via the path ```/kaggle/input``` and write all of your output files into ```/kaggle/working```.
This procedure ensures your code will run locally as well as on the Kaggle platform without any changes required.

Code that you want to execute differently locally (e.g. to test a training method only for a couple of episodes instead of waiting for a full training duration) can be distinguished by the ```DEVELOPMENT_MODE``` environment variable. In the container this variable is set to the value ```LOCAL```. 
Suppose you want to execute a training run only for 2 Episodes to test it locally but on the actual Kaggle notebook with GPU support you would want to train for 30 episodes. Then you could do the following:
```
DEVELOPMENT_MODE = os.getenv("DEVELOPMENT_MODE") == "LOCAL"

if DEVELOPMENT_MODE:
    # train for 2 epochs
    # insert local training code here

else:
    # train for 30 epochs
    # insert gpu accelerated training code here
```