FROM ubuntu:20.04

WORKDIR /src

COPY requirements.txt requirements.txt

# Install non-python related dependencies for scientific stack
RUN apt-get update && apt-get install libblas-dev liblapack-dev gfortran python3-pip -y

RUN pip3 install --upgrade pip && \
    pip3 install -r requirements.txt

EXPOSE 8888

WORKDIR /notebooks
CMD jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root
