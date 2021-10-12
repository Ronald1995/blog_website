#!/bin/bash

pylint . 
pylint_exit_code=$?
if [ "$pylint_exit_code" = "0" ]; then
	echo "pylint ok"
else
	echo "pylint error: $pylint_exit_code"
fi

mypy .
mypy_exit_code=$?
if [ "$mypy_exit_code" = "0" ]; then
	echo "mypy ok"
else
	echo "mypy error: $mypy_exit_code"
fi

pycodestyle . 
pycodestyle_exit_code=$?
if [ "$pycodestyle_exit_code" = "0" ]; then
	echo "pycodestyle ok"
else
	echo "pycodestyle error: $pycodestyle_exit_code"
fi

flake8 .
flake8_exit_code=$?
if [ "$flake8_exit_code" = "0" ]; then
	echo "flake8 ok"
else
	echo "flake8 error: $flake8_exit_code"
fi

isort . --check --diff
isort_exit_code=$?
if [ "$isort_exit_code" = "0" ]; then
	echo "isort ok"
else
	echo "isort error: $isort_exit_code"
fi
