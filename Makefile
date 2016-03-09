all :
	if [[ -e opencart-erip-payment-module.ocmod.zip ]]; then rm opencart-erip-payment-module.ocmod.zip; fi
	zip -x *.DS_Store -r opencart-erip-payment-module.ocmod.zip upload install.xml
