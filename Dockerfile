# Use a Windows base image
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Download Python 3.11.8
ADD https://www.python.org/ftp/python/3.11.8/python-3.11.8-amd64.exe C:\\temp\\python-installer.exe

# Install Python
RUN C:\\temp\\python-installer.exe /quiet InstallAllUsers=1 PrependPath=1 && del C:\\temp\\python-installer.exe

COPY client C:\\client

RUN python -m pip install -r C:\\client\\requirements.txt
# Upgrade pip and install PyInstaller
RUN python -m pip install --upgrade pip && pip install pyinstaller


RUN pyinstaller --onefile --distpath C:\\client\\dist c:\\client\\client.py

