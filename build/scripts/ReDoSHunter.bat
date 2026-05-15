@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem
@rem SPDX-License-Identifier: Apache-2.0
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  ReDoSHunter startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables, and ensure extensions are enabled
setlocal EnableExtensions

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
@rem This is normally unused
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and RE_DO_S_HUNTER_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH. 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

"%COMSPEC%" /c exit 1

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME% 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

"%COMSPEC%" /c exit 1

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\ReDoSHunter-1.0.0.jar;%APP_HOME%\lib\autorex-1.0.jar;%APP_HOME%\lib\commons-lang3-3.11.jar;%APP_HOME%\lib\antlr4-maven-plugin-4.9.1.jar;%APP_HOME%\lib\antlr4-4.9.1.jar;%APP_HOME%\lib\antlr4-runtime-4.9.1.jar;%APP_HOME%\lib\gson-2.8.5.jar;%APP_HOME%\lib\commons-io-2.7.jar;%APP_HOME%\lib\fastjson-1.2.47.jar;%APP_HOME%\lib\commons-cli-1.4.jar;%APP_HOME%\lib\prefuse-beta-20071021.jar;%APP_HOME%\lib\javatuples-1.2.jar;%APP_HOME%\lib\maven-plugin-api-3.0.5.jar;%APP_HOME%\lib\plexus-compiler-api-2.2.jar;%APP_HOME%\lib\plexus-build-api-0.0.7.jar;%APP_HOME%\lib\maven-project-2.2.1.jar;%APP_HOME%\lib\slf4j-simple-1.7.25.jar;%APP_HOME%\lib\slf4j-api-1.7.25.jar;%APP_HOME%\lib\automaton-1.11-8.jar;%APP_HOME%\lib\jgrapht-core-1.0.1.jar;%APP_HOME%\lib\maven-settings-2.2.1.jar;%APP_HOME%\lib\maven-profile-2.2.1.jar;%APP_HOME%\lib\maven-model-3.0.5.jar;%APP_HOME%\lib\maven-artifact-manager-2.2.1.jar;%APP_HOME%\lib\maven-artifact-3.0.5.jar;%APP_HOME%\lib\sisu-inject-plexus-2.3.0.jar;%APP_HOME%\lib\maven-plugin-registry-2.2.1.jar;%APP_HOME%\lib\plexus-container-default-1.0-alpha-9-stable-1.jar;%APP_HOME%\lib\maven-repository-metadata-2.2.1.jar;%APP_HOME%\lib\wagon-provider-api-1.0-beta-6.jar;%APP_HOME%\lib\plexus-utils-3.0.8.jar;%APP_HOME%\lib\ST4-4.3.jar;%APP_HOME%\lib\antlr-runtime-3.5.2.jar;%APP_HOME%\lib\org.abego.treelayout.core-1.0.3.jar;%APP_HOME%\lib\javax.json-1.0.4.jar;%APP_HOME%\lib\icu4j-61.1.jar;%APP_HOME%\lib\plexus-interpolation-1.11.jar;%APP_HOME%\lib\plexus-component-annotations-1.5.5.jar;%APP_HOME%\lib\plexus-classworlds-2.4.jar;%APP_HOME%\lib\sisu-inject-bean-2.3.0.jar;%APP_HOME%\lib\backport-util-concurrent-3.1.jar;%APP_HOME%\lib\junit-3.8.1.jar;%APP_HOME%\lib\classworlds-1.1-alpha-2.jar;%APP_HOME%\lib\sisu-guice-3.1.0-no_aop.jar;%APP_HOME%\lib\sisu-guava-0.9.9.jar


@rem Execute ReDoSHunter
@rem endlocal doesn't take effect until after the line is parsed and variables are expanded
@rem which allows us to clear the local environment before executing the java command
endlocal & "%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %RE_DO_S_HUNTER_OPTS%  -classpath "%CLASSPATH%" cn.ac.ios.ReDoSMain %* & call :exitWithErrorLevel

:exitWithErrorLevel
@rem Use "%COMSPEC%" /c exit to allow operators to work properly in scripts
"%COMSPEC%" /c exit %ERRORLEVEL%
