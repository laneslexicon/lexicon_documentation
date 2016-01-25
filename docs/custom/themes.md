The primary motivation behind using 'themes' is to isolate configuration changes so that it is possible to maintain a clean, working environment: each theme has its own copy of the configuration files described in the previous section.

This is achieved through the directory structure - each theme has its own directory and a its own copy of the various files e.g. icons, configuration files. While this requires a certain amount of duplication the overhead is not large (approximately 5mb).

The root directory on Windows,Linux and \*BSD is

    [install directory]/Resources

while on OSX it is

    [application directory]/Contents/Resources


The Resources  directory contains the following layout:

<div align="center">
<table id="resourceslayout">
    <tr>
        <td class="themedirectory">Resources</td>
        <td></td><td></td><td></td><td></td>
    </tr>
    <tr>
        <td class="directorypad"></td>
        <td class="file">config.ini</td>
        <td></td><td></td>
        <td>this file points to the current theme</td>
    </tr>
    <tr>
        <td colspan="1" class="directorypad"></td>
        <td class="themedirectory">themes</td>
        <td></td><td></td>
        <td>Each subdirectory is a unique theme</td>
    </tr>
    <tr>
        <td class="directorypad" colspan="2"></td>
        <td class="themedirectory">default</td>
        <td></td>
        <td>A theme called 'default'</td>
    </tr>
    <tr>
        <td class="directorypad" colspan="3"></td>
        <td>settings.ini</td>
        <td>This file contains the configuration options for the theme name 'default.</td>
    </tr>
    <tr>
        <td class="directorypad" colspan=3></td>
        <td>css</td>
        <td>A directory containing stylesheets</td>
    </tr>
    <tr>
        <td class="directorypad" colspan=3></td>
        <td>keyboards</td>
        <td>A directory containing the virtual keyboard definitions</td>
    </tr>
    <tr>
        <td colspan="3" class="directorypad"></td>
        <td class="themedirectory">images</td>
        <td>Application icons etc</td>
    </tr>
    <tr>
        <td colspan="3" class="directorypad"></td>
        <td class="themedirectory">xlst</td>
        <td>XSLT files</td>
    </tr>
    <tr>
        <td colspan="3" class="directorypad"></td>
        <td class="themedirectory">maps</td>
        <td>Keyboard maps</td>
    </tr>
    <tr>
        <td colspan="2" class="directorypad"></td>
        <td class="themedirectory">My Theme</td>
        <td></td>
        <td>A theme called 'My Theme'</td>
    </tr>
    <tr>
        <td class="directorypad" colspan="3"></td>
        <td>settings.ini</td>
        <td>This file contains the configuration options for 'My Theme'</td>
    </tr>
    <tr>
        <td colspan="5">Etc...</td>
    </tr>
</table>
</div>

Creating a new theme is simply a matter of copying the current theme and giving it a new name. This can be done either from *Menu->Themes->New/Copy* or by using the operating system's file manager.
