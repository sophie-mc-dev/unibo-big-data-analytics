import kaggle

kaggle.api.authenticate()

kaggle.api.dataset_download_files('alexteboul/diabetes-health-indicators-dataset', path='./notebooks/data', unzip=True)