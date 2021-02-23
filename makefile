init:
	pipenv install && pipenv run ./windows-exploit-suggester.py --update

test:
	pipenv run ./windows-exploit-suggester.py --database 2021-02-23-mssb.xls --systeminfo sysinfo.sample
