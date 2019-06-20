# qo-100-dbv-s2
This Repository will have all my Code to Decode QO-100  Eshail-2 DBV-S2 Satellite TV signals<br>
# Project Status
This Project has working script for the difren Bit rates.
# Software Installation procedure.
<b>Dependency software</b><br>
Download the Leansdr from github https://github.com/pabr/leansdr.git<br>
Download and install the SDRPlay API driver https://www.sdrplay.com/windl.php<br>
Download and install the rsp_tcp server not neseitie but handy when testing  https://github.com/SDRplay/RSPTCPServer<br>
Download and install GQRX follow the instructions here http://gqrx.dk/download/install-ubuntu<br>
<b>DVB-S2 Software</b><br>
Install VLC sudo apt-get install vlc<br>
>git clone http://github.com/pabr/leansdr.git<br>
>cd leansdr/src/apps'''<br>
vi Makefile  # For DVB-S2, find and uncomment LEANSDR_EXTENSIONS<br>
make<br>
Set the buffer size<br>
echo 32000000 > /proc/sys/fs/pipe-max-size<br>
cd leansdr/test<br>
make leandvb-ft<br>
Sta in the test directory<br>
git clone -b ldpc_tool http://github.com/pabr/xdsopl-LDPC-pabr<br>
cd xdsopl-LDPC-pabr<br>
make CXX=g++ ldpc_tool<br>
cd ldpc_test<br>
make leandvb-snr<br>
If all worked ok we now need to copy the ldpc_tool in the apps directory
cd ../src/app/<br>
cp -R ../../test/ldpc_tool ./<br>
There should now be an ldpc_tool directory in the leansdr/src/app/ directory<br>
We are now ready to start testing.<br>








# Hardware required.
Linux (Ubuntu)<br>
MSI (MSI chipset rtl dongle 12bit 10Mhz sampleing<br>
Power inhector  for LNB<br>
1.2M dish preferd to get proper Signal to noise ration to get stable reception.<br>

# Screen Shots of some of the decoded Video's
RC Rate 125K
![Alt text](qo-100_dbv_1.png?raw=true "DBV-S2")<br>
RC rate 333K<br>
![Alt text](qo-100_dbv_2.png?raw=true "DBV-S2")<br>
RC Rate 2M<br>
![Alt text](qo-100_dbv_3.png?raw=true "DBV-S2")<br>


