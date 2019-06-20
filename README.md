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

# Exsample of testing signal
rx_sdr -f 742307200 -g 19 -s 2400000 - |./leandvb --inpipe 32000000 --nhelpers 6 --sr 2000e3 --sampler rrc --rrc-rej 30 --standard DVB-S2 --ldpc-helper ldpc_tool -v -d | vlc -

<b>Important Paramters to consider</b>
>--drift track for Oselator drift<br>
>--decim N  Decimation if you over sample this could improove the S/N (Signal to noise ratio)<br>
>--sampler --rrc-rej  add adtional filter <br>
>--inpipe BYTES add bigger buffer if your CPU is very busy this could help to resove the gaps when CPU is busy (E.G. 32000000) <br>
>-f HZ Specifies the sampling rate of the I/Q stream on standard input ( I am using RX_sdr and not RTL_tcp witch alow me to use SDRPLAY MSI chipset devicess that can sample upto 10Mhz)<br>
>-sr HZ (2e6, 1e6, 500e3, 333e3, 250e3)<br>
>--tune HZ For example a signal at 397.1 MHz can be received either with rx_sdr -f 397100000 | leandvb or with rx_sdr -f 397000000 | leandvb --tune 100e3<br>
>--ldpc-helper ldpc_tool (allow U to use external tools to decode DVB E.G ldpc_tool<br>
>--standard DVB-S2 (Spesify the Decoding to be done)<br>


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


