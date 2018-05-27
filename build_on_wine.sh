#!/bin/bash

set -e

winbuildenv buildZLIB.bat
winbuildenv buildOpenSSL.bat
winbuildenv buildPython.bat
winbuildenv buildSubprocess32.bat
WINEDLLOVERRIDES=cmd.exe=b,n winbuildenv buildBoost.bat # Need to use the wine cmd.exe, otherwise there's access denied errors...
winbuildenv buildJPEG.bat
winbuildenv buildTIFF.bat
winbuildenv buildPNG.bat
winbuildenv buildFreeType.bat
winbuildenv buildTBB.bat
winbuildenv buildEXR.bat
winbuildenv buildFonts.bat
winbuildenv buildGLEW.bat
winbuildenv buildOCIO.bat
winbuildenv buildOIIO.bat
winbuildenv buildBlosc.bat
winbuildenv buildVDB.bat
winbuildenv buildLLVM.bat
winbuildenv buildOSL.bat
winbuildenv buildHDF5.bat
winbuildenv buildAlembic.bat
winbuildenv buildXerces.bat
winbuildenv buildAppleseed.bat
winbuildenv buildResources.bat
#winbuildenv buildUSD.bat
#winbuildenv buildCortex.bat
winbuildenv buildPyOpenGL.bat
winbuildenv buildQt.bat
winbuildenv buildPySide.bat
winbuildenv buildQtPy.bat
winbuildenv buildPackage.bat
