FROM python

WORKDIR /app
COPY . .

VOLUME [ "/inputs","/outputs" ]

RUN pip install pipenv && \
    pipenv lock && \
    PIPENV_VENV_IN_PROJECT="true" pipenv sync

ENTRYPOINT [ "pipenv","run","python","AnimeGANv3-Python.py","/inputs","/outputs", "--onnx-model-type","H40"]