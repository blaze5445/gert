# NNChannelTracker

Nin-Nin Channel Tracker Addon for Tree of Savior

This _experimental_ Addon will log channel populations to a CSV logfile every
two minutes. It is best used in conjunction with [Nin-Nin Uplink](https://github.com/ScorpicSavior/NinNinUplink)
but can be used standalone without problems.

The current version has no means to turn the logger off. Remove the Addon if you
don't want to log any more data.

## Installing

Go to the [releases](https://github.com/ScorpicSavior/NNChannelTracker/releases)
page on GitHub and download the zip bundle (not the source code). Extract it
directly into your ToS folder; for most people, it's located at
`C:\Program Files (x86)\Steam\SteamApps\common\TreeOfSavior`

There should be a file named `📜nnchannel.ipf` in the `data` folder of ToS
after extracting. The emoticon must be there, so the ToS updater won't delete
the Addon. Depending on your version of Windows, the emoticon might be shown as
a single white square; this is okay.

Also there should be an empty folder "nnchannel" within the "addons" folder of
the game after you've extracted the zip. This is on purpose, since Addons can't
create empty folders on their own. This folder will later hold a file called
`population_log.csv` which represents the channel populations logfile.

After you followed these steps, you can (re-)start the game. It should then
write data to its logfile on every even minute.

There are no known issues/incompatibilities with other Addons.

## Building From Source

In order to build the Addon from source (rather than using the release version
as stated above), you need to place the following files into the `tools` folder
after cloning the repository:

* `ies.py` and `ipf.py` from [treeofsavior-tools](https://github.com/TwoLaid/treeofsavior-tools)
* `ipf_unpack.exe` and `zlib1.dll` from [IPFUnpacker](https://github.com/r1emu/IPFUnpacker)

You will also need to install Python 2.7, I recommend [Active Python](http://www.activestate.com/activepython/downloads).

After that, you can run the `build.py` script to get the .ipf file ready
to be placed into the `data` folder of your game. You also have to create an
empty folder `addons\nnchannel` so the Addon can create the logfile there.

## License

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Additional Disclaimer

This project is not affiliated with Tree of Savior / IMCGAMES CO., LTD. in any way.
