# Makefile
Usefull makefile rules for standard C++ project developement

PROJECT HIERARCHY
====================
```
│   make.bat
│   Makefile
│
├───bin
│       <*.o>
├───build
│       <*.exe>
│       <*.out>
├───src
│       main.cpp
│       <*.cpp>
│       <*.h>
│
└───test
    ├───bin
    │       <*.o>
    ├───build
    │       <*.exe>
    │       <*.out>
    └───src
        main.cpp
        <*.cpp>
        <*.h>
```

SYNTAX
====================

WINDOWS (CMD)
--------------------
```
make [arg]
```

WINDOWS (POWERSHELL)
--------------------
```
./make [arg]
```

LINUX (TERMINAL)
--------------------
```
make [arg]
```

Arguments
====================

WINDOWS
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

LINUX
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