# HeightWidthCoreMLKerasTest
This is a super simple end to end test of Keras, TensorFlow and CoreML.

It create an incredible simple linear regression model from some height/width statistics and export the model to CoreML in order to use it as a function inside a sample iOS App.  Of course no real reason to use ML in a scenario like this.  Just a simple test with documented step by step instructions.

** WORK IN PROGRESS

Step by step instruction to create a very simple ML model using Keras/TensorFlow, import it on CoreML using CoreMLConversionTool and using it locally on a simple iOS App


# Download and Install Anaconda Python 3.6
    https://www.continuum.io/downloads


# Clone this repository on your local computer
    git clone https://github.com/JacopoMangiavacchi/HeightWidthCoreMLKerasTest.git


# Create the Keras, TensorFlow, Python, CoreML environment
    conda env create

This environment is created based on the environment.yml file for iinstalling Python 2.7, TensorFlow 1.1, Keras 2.0.4, CoreMLTools 0.6.3, Pandas and other Python usefull packages:


    name: KerasTensorFlowCoreML
    channels:
        - !!python/unicode
        'defaults'
    dependencies:
        - python=2.7
        - pip==9.0.1
        - numpy==1.12.0
        - jupyter==1.0
        - matplotlib==2.0.0
        - scikit-learn==0.18.1
        - scipy==0.19.0
        - pandas==0.19.2
        - pillow==4.0.0
        - seaborn==0.7.1
        - h5py==2.7.0
        - pip:
            - tensorflow==1.1.0
            - keras==2.0.4
            - coremltools==0.6.3



Wait for the environment to create.

# Activate the environment (Mac/Linux)
    source activate KerasTensorFlowCoreML

# Activate the environment (Windows)
    activate KerasTensorFlowCoreML

# Check that your prompt changed to
    (KerasTensorFlowCoreML) $

# Launch Jupyter Notebook
    jupyter notebook

# Open your browser to
    http://localhost:8888


# Open Jupyter createModel notebook
Open createModel.ipynb in your Jupyter browsing session

Execute any cells in order to create, save and export the Keras Model using CoreML Exporting Tools


The CoreML Model will be saved in the current folder as HeightWidth_model.mlmodel


** TODO



# Delete Environment

source deactivate
conda remove -y -n KerasTensorFlowCoreML --all
