# pyProJF

Este é um projeto Flask funcional e, ao mesmo tempo, uma base de aprendizado
para criar e configurar novos projetos Python. Os exemplos usam Flask; adapte
as dependências e os comandos conforme a necessidade de cada projeto.

## Requisitos

- Python 3.12 ou superior, menor que 4.0.
- Opção de escolher o método para gerenciar o projeto: `uv`, Poetry ou `venv` com `pip`.

Não é necessário usar `uv`, Poetry e `pip` juntos no mesmo projeto.

## Instalar este projeto

Execute os comandos na pasta deste repositório.

### Com uv

```shell
uv sync
```

### Com Poetry

```shell
poetry install
```

### Com Python, venv e pip

Windows:

```powershell
py -3.12 -m venv .venv
.\.venv\Scripts\python -m pip install -r requirements.txt
```

Linux/macOS:

```bash
python3.12 -m venv .venv
.venv/bin/python -m pip install -r requirements.txt
```

## Executar este projeto

Para desenvolvimento local:

```shell
# uv
uv run python app.py

# Poetry
poetry run python app.py

# venv com pip (ative o ambiente virtual antes)
python app.py
```

Abra `http://localhost:5191`.

Para iniciar com Waitress:

```shell
# uv
uv run waitress-serve --host 0.0.0.0 --port 5191 app:app

# Poetry
poetry run waitress-serve --host 0.0.0.0 --port 5191 app:app

# venv com pip (ative o ambiente virtual antes)
waitress-serve --host 0.0.0.0 --port 5191 app:app
```

Os scripts incluídos também instalam as dependências em `.venv` e iniciam o
Waitress:

```powershell
# Windows
.\run.cmd
```

```bash
# Linux/macOS
./start.sh
```

## Criar um projeto

Os exemplos abaixo criam um projeto separado. Não execute `uv init` ou
`poetry new` na pasta deste repositório.

### Com uv

```shell
uv init projeto-python
cd projeto-python
uv add flask waitress
```

### Com Poetry

```shell
poetry new projeto-python
cd projeto-python
poetry add flask waitress
```

### Com Python, venv e pip

```shell
mkdir projeto-python
cd projeto-python
python -m venv .venv
```

Ative o ambiente virtual antes de instalar pacotes:

```bash
# Windows Terminal
.venv\Scripts\activate
```

```powershell
# Windows PowerShell
.\.venv\Scripts\Activate.ps1
```

```bash
# Linux/macOS
source .venv/bin/activate
```

Instale as dependências e registre-as para recriar o ambiente depois:

```shell
python -m pip install Flask waitress
python -m pip freeze > requirements.txt
```

Em outro ambiente, recrie e instale as dependências com:

```shell
python -m venv .venv
python -m pip install -r requirements.txt
```

Ative o ambiente virtual antes de executar os comandos `python` desse método.

## Configurar a aplicação Flask

Crie um arquivo `app.py` na raiz do projeto:

```python
from flask import Flask

app = Flask(__name__)

@app.get("/")
def home():
    return "Aplicação funcionando"

if __name__ == "__main__":
    app.run(port=8000, debug=True)
```

... future


## Referências

- [uv](https://docs.astral.sh/uv/)
- [Poetry](https://python-poetry.org/docs/)
- [venv](https://docs.python.org/3/library/venv.html)
- [Waitress](https://docs.pylonsproject.org/projects/waitress/en/stable/)
- [Gunicorn](https://docs.gunicorn.org/en/stable/)
