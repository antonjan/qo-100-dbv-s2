#sudo 4194304 > /proc/sys/fs/pipe-max-size

#rx_sdr -f 742386200 -g 1 -s 2400000 - | csdr gain_ff 0.1 |./leandvb --gui --inpipe 32000000 --nhelpers 6 --sr 2000e3 --sampler rrc --rrc-rej 30 --standard DVB-S2 --ldpc-helper ldpc_tool -v -d | vlc -

#rx_sdr -f 746007200 -g 19 -s 2400000 - |./leandvb --gui --inpipe 32000000 --nhelpers 6 --sr 500e3 --sampler rrc --rrc-rej 30 --standard DVB-S2 --ldpc-helper ldpc_tool -v -d | vlc -

#rx_sdr -f 747007200 -g 19 -s 2400000 - |./leandvb  --inpipe 32000000 --nhelpers 6 --sr 250e3 --sampler rrc --rrc-rej 30 --standard DVB-S2 --ldpc-helper ldpc_tool -v -d | vlc -

#rx_sdr -f 746007200 -g 19 -s 2400000 - |./leandvb  --inpipe 32000000 --nhelpers 6 --sr 1000e3 --sampler rrc --rrc-rej 30 --standard DVB-S2 --ldpc-helper ldpc_tool -v -d | vlc -

rx_sdr -f 742307200 -g 19 -s 2400000 - |./leandvb --inpipe 32000000 --nhelpers 6 --sr 2000e3 --sampler rrc --rrc-rej 30 --standard DVB-S2 --ldpc-helper ldpc_tool -v -d | vlc -


#rx_sdr -f 746007200 -g 19 -s 2400000 - |./leandvb --gui --inpipe 32000000 --nhelpers 6 --sr 500e3 --sampler rrc --rrc-rej 30 --standard DVB-S2 --ldpc-helper ldpc_tool -v -d | vlc -

#recoding ofline and then later display video
#rtl_sdr  -f 397000000  -s 2400000  capture.iq 
#./leandvb  --gui  --hq  < capture.iq  > capture.ts
#ffplay capture.ts

# --drift track for Oselator drift
# --decim N  Decimation if you over sample this could improove the S/N (Signal to noise ratio)
# --sampler --rrc-rej  add adtional filter 
# --inpipe BYTES add bigger buffer if your CPU is very busy this could help to resove the gaps when CPU is busy (E.G. 32000000) 
# -f HZ Specifies the sampling rate of the I/Q stream on standard input ( I am using RX_sdr and not RTL_tcp witch alow me to use SDRPLAY MSI chipset devicess that can sample upto 10Mhz)
# -sr HZ (2e6, 1e6, 500e3, 333e3, 250e3)
# --tune HZ For example a signal at 397.1 MHz can be received either with rx_sdr -f 397100000 | leandvb or with rx_sdr -f 397000000 | leandvb --tune 100e3
# --ldpc-helper ldpc_tool (allow U to use external tools to decode DVB E.G ldpc_tool
# --standard DVB-S2 (Spesify the Decoding to be done)
#
