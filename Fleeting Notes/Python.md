---
tags:
  - cs/programming
---
##### Magic Methods

Also called special or dunder methods

Automatically trigerred. Cannot be called directly by [[Object Oriented Programming#Object |object]] in a class.

-> [A list of magic methods](https://www.geeksforgeeks.org/dunder-magic-methods-python/)
#### Environments

##### Venv
- Virtual environment

```shell title:"Initializing env"
python3 -m venv $env_name
./$env_name/Scripts/activate
```
##### Conda
- Virtual environment and package management

```shell title:"Installing Miniconda"
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
```

**CLI Commands**
- `conda create`
	- `-n $name` / `env -n $name` : creates env with name=`$name`
	- `-p $path`: to specify a path for the env
- `conda activate $name` & `conda deactivate`: to enable/disable an environment

##### Pip
-  Package management

**CLI Commands**
- `pip install`
	- `$pkg1 $pkg2:` install pkgs directly
	- `-r $file`: install pkgs mentioned in file
- `pip freeze`
	- `> $file`: outputs installed env dependencies to file