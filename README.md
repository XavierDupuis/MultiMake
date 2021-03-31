# MultiMake
C/C++ Windows development makefiles rules for multi projects environment

<div style="text-align: center;"><img src="assets/title.png"></div>

DESCRIPTION
====================
MultiMake is a set of makefile rules used to develop, build, test and run sub-projects.<br>
MultiMake uses "children" makefile to manage every project component<br>
Note : The "<i>project</i>" directory can also be used as a standalone project using the make.bat tool<br>

PROJECT HIERARCHY
====================
```
│   multimake.bat           
│   projects.txt
│
├───output
│   ├───run
│   │       <*.txt>
│   └───test
│           <*.txt>
│
├───project
│   │
│   │   make.bat
│   │
│   ├───bin
│   │       <*.o>
│   ├───build
│   │       <*.exe>
│   │       <*.out>
│   ├───src
│   │       main.cpp
│   │       <*.cpp>
│   │       <*.h>
│   │
│   └───test
│       ├───bin
│       │       <*.o>
│       ├───build
│       │       <*.exe>
│       │       <*.out>
│       └───src
│           main.cpp
│           <*.cpp>
│           <*.h>
│
├───project2
│
│   <...>
```


MULTIMAKE (WINDOWS ONLY)
====================

SYNTAX (WINDOWS CMD)
--------------------
```
multimake [arg]
```
Note : Windows PowerShell requires 
```
./multimake [arg]
```

ARGUMENTS
--------------------
 <table>
  <tr>
    <th>[arg]</th>
    <th>effect</th>
  </tr>
   <tr>
     <td><no_arg></td>
     <td>Executes MAKE rules and outputs to /output/run</td>
   </tr>
   <tr>
     <td>run</td>
     <td>Executes MAKE rules and outputs to /output/run</td>
   </tr>
   <tr>
     <td>help</td>
     <td>Displays help informations</td>
   </tr>
   <tr>
     <td>test</td>
     <td>Executes MAKE rules and outputs to /output/test</td>
   </tr>
   <tr>
     <td>clean</td>
     <td>Delete /output, /bin and /build directories</td>
   </tr>
 </table> 
<br>



MAKEFILE (WINDOWS AND LINUX)
====================

SYNTAX (WINDOWS CMD & LINUX)
--------------------
```
make [arg]
```
Note : Windows PowerShell requires 
```
./make [arg]
```

ARGUMENTS (WINDOWS)
--------------------
 <table>
  <tr>
    <th>[arg]</th>
    <th>effect</th>
  </tr>
   <tr>
     <td><no_arg></td>
     <td>Executes MAKE rule (compile and link)</td>
   </tr>
   <tr>
     <td>make</td>
     <td>Executes MAKE rule (compile and link)</td>
   </tr>
  <tr>
    <td>help</td>
    <td>Displays help informations</td>
   </tr>
   <tr>
    <td>start</td>
    <td>Executes MAKE rule and start in single window</td>
   </tr>
   <tr>
    <td>run</td>
    <td>Executes MAKE rule and run executable in console</td>
   </tr>
   <tr>
    <td>test</td>
    <td>Executes MAKE rule and run test file in console </td>
   </tr>
   <tr>
    <td>clean</td>
    <td>Delete /bin and /build directories</td>
   </tr>
 </table> 
<br>

ARGUMENTS (LINUX)
--------------------
 <table>
  <tr>
    <th>[arg]</th>
    <th>effect</th>
  </tr>
   <tr>
     <td><no_arg></td>
     <td>make all</td>
   </tr>
   <tr>
     <td>all</td>
     <td>make all</td>
   </tr>
   <tr>
     <td>run</td>
     <td>execute program.out</td>
   </tr>
   <tr>
     <td>test</td>
     <td>execute test.program.out</td>
   </tr>
   <tr>
     <td>clean</td>
     <td>remove bin and build directories</td>
   </tr>
   <tr>
     <td>help</td>
     <td>show help page</td>
   </tr>
   <tr>
     <td>printvars</td>
     <td>print makefile variables</td>
   </tr>
 </table>
 <br>

 