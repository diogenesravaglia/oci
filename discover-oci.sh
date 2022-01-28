#!/bin/sh
##########################################################################
#
# Author.........: Diogenes L. Ravaglia - diogenes.ravaglia@ninecon.com.br
# Description....: Discover oci resources
# Call Syntax....: sh discover-resource-oci.sh
# Last Modified..: 27/01/2022
#
##########################################################################
#Env
export DATE=`date '+%Y%m%d'`
export APPDIR=$HOME/showoci
export PYTHONPATH=$HOME/python
export REPORT_DIR=${APPDIR}/report
export CSV_DIR=${REPORT_DIR}/csv
export PATH=${PYTHONPATH}/bin:$PATH
mkdir -p ${REPORT_DIR}
mkdir -p ${CSV_DIR}
OUTPUT_FILE=${REPORT_DIR}/${DATE}_showoci_report.txt
CSV_FILE=${CSV_DIR}/showoci_report
export LOG=${CSV_FILE}/scan-ninecon.log
mkdir -vp ${CSV_FILE} >/dev/null
#
clear
echo -e "-----------------------"
echo -e "Download oci-python-sdk"
echo -e "-----------------------"
echo -e ""
#
git clone https://github.com/oracle/oci-python-sdk       
#                                                        >> $LOG
echo -e "-----------------------------------------"
echo -e "-----------------------------------------"
clear
echo -e "------------------------------------"
echo -e "Executando discover dos recursos oci"
echo -e "------------------------------------"
echo -e ""
cp -rp oci-python-sdk/examples/showoci ~/.               
cd oci-python-sdk/examples/showoci                       
#                                                        >> ${LOG}
cd ~/showoci                                             
python3 showoci.py -dt -ani -csv $CSV_FILE               > ${REPORT_DIR}/${DATE}_showoci_report.txt
#                                                        >> ${LOG}
cd ~/showoci                                      
tar -cvzf oci_ninecon.tar.gz report                         
cp oci_ninecon.tar.gz ~/.                                
cd ~                                                     
#                                                        >> ${LOG}
rm -rf ~/oci-python-sdk                                  
rm -rf ~/showoci                                         
clear
echo -e "Discover finalizado"
echo -e "-------------------"
echo -e ""
echo -e "Realize o download do arquivo oci_ninecon.tar.gz e envie para equipe de arquitetura cloud NINECON"
echo -e ""
