# Module test benches

sha_round_usage_tb.out : sha_round_usage_tb.v ../sha_round.v
	iverilog -o $@  $^

sha_round_usage_tb : sha_round_usage_tb.out
	vvp $^

sha_unit_usage_tb.out : sha_unit_usage_tb.v ../sha_unit.v ../w_expand.v ../sha_round.v
	iverilog -o $@  $^

sha_unit_usage_tb : sha_unit_usage_tb.out
	vvp $^

shapool_usage_tb.out : shapool_usage_tb.v ../shapool.v ../difficulty_map.v ../SHA256_K.v ../sha_unit.v ../w_expand.v ../sha_round.v
	iverilog -o $@  $^

shapool_usage_tb : shapool_usage_tb.out
	vvp $^

external_io_usage_tb.out : external_io_usage_tb.v ../external_io.v
	iverilog -o $@  $^

external_io_usage_tb : external_io_usage_tb.out
	vvp $^

.phony : clean
clean :
	rm -f sha_round_usage_tb.out \
	      sha_unit_usage_tb.out \
		  sha_unit_usage_tb.vcd \
		  external_io_usage_tb.out \
		  external_io_usage_tb.vcd

#clean_tests :
#	rm -f test_top.out \
#		  test_top.vcd \
#	      test_multi_top.out \
#	      test_shapool.out \
#		  test_sha_unit.out \
#		  test_external_out.vcd \
#		  test_external_io.vcd \
#		  top_power.blif top_power.asc top_power.bin \
#	      top_idle.blif top_idle.asc top_idle.bin \
#	      top_RAM.blif top_RAM.asc top_RAM.bin \
#	      top_tri.blif top_tri.asc top_tri.bin \
#	      top_single_39.blif top_single_39.asc top_single_39.bin