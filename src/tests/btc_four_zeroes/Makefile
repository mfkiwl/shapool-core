VENDOR_PATH=../vendor/
MUNIT_C_PATH=../vendor/munit/munit.c
ICEPOOL_PATH=../vendor/icepool-driver/src/
LIBICEPOOL_PATH=../vendor/icepool-driver/src/
FTDI_PATH=/usr/include/ftdi1/
LIBFTDI_PATH=/usr/lib/

.phony : build
build : btc_four_zeroes gateware

.phony : run
run : build flash
	./btc_four_zeroes

btc_four_zeroes : main.c $(MUNIT_C_PATH) libicepool 
	gcc --std=c99 -g -o $@ -I$(VENDOR_PATH) -I$(ICEPOOL_PATH) -I$(FTDI_PATH) $< $(MUNIT_C_PATH) -L$(LIBICEPOOL_PATH) -licepool-d -L$(LIBFTDI_PATH) -lftdi1

.phony : libicepool
libicepool :
	make -C $(ICEPOOL_PATH) libicepool-d.a 

.phony : gateware
gateware :
	make -C ./rtl build 

.phony : flash 
flash :
	make -C rtl/ flash

.phony : clean
clean :
	make -C ./rtl clean
	rm -f ./btc_four_zeroes