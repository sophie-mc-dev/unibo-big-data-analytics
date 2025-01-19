# Big Data Analysis with Vagrant

This repository contains a Vagrant-based environment setup for performing data analysis using the [**CDC Diabetes Health Indicators Dataset**](https://www.kaggle.com/datasets/alexteboul/diabetes-health-indicators-dataset/data).

This project was implemented in the context of the Big Data Analytics and Text Mining class from UNIBO's Master's degree in Artificial Intelligence.

## Project Setup

### Prerequisites

Before starting with the Vagrant environment, ensure that the following tools are installed on your local machine:

- **Vagrant**: A tool for building and maintaining virtualized development environments.
- **VirtualBox**: A free and open-source hosted hypervisor for running virtual machines.
- **Git**: Version control system for managing project files.
- **Kaggle API**: Required to download the dataset directly through the Kaggle API.

### Project Files

- `Vagrantfile`: Configuration file for setting up the virtual machine.
- `bootstrap.sh`: Shell script for provisioning the VM and installing necessary packages and dependencies.

### Local Environment Setup

1. **Clone the repository:**

   ```bash
   git clone https://github.com/sophie-mc-dev/unibo-big-data-analytics.git
   cd unibo-big-data-analytics
   ```

2. **Download the Dataset:**

   To download the **CDC Diabetes Health Indicators Dataset** directly, you have to use the Kaggle API. Once you have downloaded the kaggle.json file from your Kaggle profile into your home directory:

   - Execute the download_data Python script:

     ```bash
     python3 download_data.py
     ```

   You can also visit the Kaggle page for manual downloading: [Diabetes Health Indicators Dataset](https://www.kaggle.com/datasets/alexteboul/diabetes-health-indicators-dataset)

3. **Start the Vagrant VM:**

   This command will download the specified Ubuntu box, create a virtual machine, and provision it with the required tools and packages.

   ```bash
   vagrant up
   ```

   ```bash
   vagrant ssh
   ```

   - The VM will be configured with:
     - Python 3
     - Jupyter Notebook
     - Various Python data analysis libraries (e.g., Pandas, Matplotlib)

4. **Access Jupyter Notebook:**

   Once the Vagrant VM is up and running, you can access Jupyter Notebooks by navigating to the link resulting from the following command:

    ```bash
   jupyter notebook --ip=0.0.0.0 --no-browser
   ```

   You can access the notebooks and start your data analysis tasks from this interface.

5. **Working with Notebooks:**

   You can create new notebooks or open existing ones from the shared folder (`./notebooks` in the repository). Any changes made will be reflected in both the VM and your local machine.

### Directory Structure

- `notebooks/`: Directory for storing your Jupyter Notebooks. The folder is shared between your local machine and the Vagrant VM.
- `bootstrap.sh`: Shell script for provisioning the VM with required tools and dependencies.
- `download_data.py`: Python script for downloading the dataset data through the kaggle API.
- `Vagrantfile`: Vagrant configuration file for setting up the environment.

## Configuration and Customization

You can modify the `bootstrap.sh` file to install additional tools or change configuration based on your needs. The Vagrant configuration (`Vagrantfile`) can also be adjusted to allocate more resources (e.g., more RAM or CPU cores) if needed.

## Requirements

### Python Libraries:

- `matplotlib`
- `pandas`
- `seaborn`
- `jupyter`

## Notes

- **.vagrant folder**: This folder is generated by Vagrant to store VM state and should not be committed to version control.
- **Shared Folder**: The folder `./notebooks` on your local machine is synchronized with `/home/vagrant/notebooks` inside the Vagrant VM. Any files placed here can be accessed from both environments.
- **Modifying bootstrap.sh**: When making changes to the `bootstrap.sh` file, make sure to run the following command before starting the VM:

```bash
   vagrant reload --provision
```
