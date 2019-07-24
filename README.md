# buildLibrealsense2TX2
Build librealsense 2.0 library on the NVIDIA Jetson TX2 Developer Kit. Intel RealSense D400 series cameras.

This is for version L4T 32.1 (JetPack 4.2), librealsense v2.22.0.

Reference link:

  https://github.com/alexrashed/buildJetsonTX2Kernel/tree/Jetpack_4
  
  https://www.jetsonhacks.com/2019/01/21/intel-realsense-d435i-on-nvidia-jetson-agx-xavier/
  
  https://github.com/jetsonhacks/buildLibrealsense2Xavier
  
  https://github.com/IntelRealSense/librealsense

May 2019

In order for librealsense to work properly, the kernel Image must be rebuilt and patches applied to the UVC module and some other support modules. In addition, for support of the extra features of the D435i camera such as the IMU, extra modules must be built.

Because the TX2 with flashed Jetpack4.2 run kernel version 4.9 and librealsense does not support that kernel version directly, custom patches have been constructed based on the patches in librealsense. These are located in the 'patches' directory.

In order to build and install the patched kernel Image and modules:

$ ./buildPatchedKernel.sh

On the stock Jetson TX2 install, there is no zImage in the boot directory.So we just copy the Image file over.Note that if you are compiling on an external device, like a SSD, you should probably copy this over to the internal eMMC if that is where the Jetson boots.

NOTE:Make sure where the Image file on TX2 turely is,and cover to it by Image file under image directory.Remember backup the Image file on TX2 before you cover to it.

$ sudo cp ./image/Image /boot

Then,reboot your device.

You may remove all the kernel source using the provided convenience script 'removeAllKernelSources.sh'.

You are then ready to install librealsense 2.

Run the convenience script:

$ ./installLibrealsense.sh

This will build the librealsense libraries and examples. The examples will be placed in /usr/local/bin.

Application Patching

Currently there are issues with the realsense-viewer application. The first issue is that sometimes when using large frame sizes, incomplete frames are received. This is a library wide issue, not strictly limited to the realsense-viewer app. The second issue is that one of the processes tends to block in the realsense-viewer app. There are two work around patches provided here. The patches may be applied with:

$ ./patchApplication.sh

Note that you will need to recompile the library and application for these to take effect.

Release Notes:

May, 2019

* Initial Release - v0.8
* NVIDIA Jetson TX2
* JetPack 4.2 (Developers Preview)
* L4T 32.1
* Tested on D435i and D435 Intel Realsense Cameras




