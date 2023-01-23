from setuptools import setup, find_packages

setup(
    name='awesome-pygmets',
    description='The most awesome pygments style.',
    long_description='This style was created to fit with the classes from  github.com/LukasPietzschmann/tex-classes',
    author='Lukas Pietzschmann',
    author_email='lukas.pietzschmann@outlook.de',
    download_url='https://github.com/LukasPietzschmann/tex-classes',
    version='1.0.0',
    packages=find_packages(),
    entry_points = """
    [pygments.styles]
    awesome = style.style:AwesomeStyle
    """
)
